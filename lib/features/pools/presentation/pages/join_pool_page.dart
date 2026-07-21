import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_dropdown_field.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/pools/domain/entities/join_pool_request.dart';
import 'package:co_buy/features/pools/domain/entities/pool_payment.dart';
import 'package:co_buy/features/pools/presentation/blocs/join_pool_bloc/join_pool_bloc.dart';
import 'package:co_buy/features/pools/presentation/blocs/join_pool_form_bloc/join_pool_form_bloc.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_details_bloc/pool_details_bloc.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_payment_bloc/pool_payment_bloc.dart';
import 'package:co_buy/features/pools/presentation/widgets/account_verified_card.dart';
import 'package:co_buy/features/pools/presentation/widgets/join_pool_review_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class JoinPoolPage extends StatefulWidget {
  const JoinPoolPage({super.key, required this.poolId});

  final String poolId;

  @override
  State<JoinPoolPage> createState() => _JoinPoolPageState();
}

class _JoinPoolPageState extends State<JoinPoolPage> {
  final _accountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final joinPoolBloc = getIt<JoinPoolBloc>();
    joinPoolBloc.add(const JoinPoolEvent.banksFetchRequested());
    // Singleton outlives the page — clear a previous visit's state.
    joinPoolBloc.add(const JoinPoolEvent.accountLookupCleared());
    joinPoolBloc.add(const JoinPoolEvent.submitStateCleared());
  }

  @override
  void dispose() {
    _accountController.dispose();
    super.dispose();
  }

  void _onJoinPool(BuildContext context) {
    final detailsState = context.read<PoolDetailsBloc>().state;
    final details = detailsState.details;
    if (details == null) {
      // Review sheet needs details — retry rather than submit incomplete.
      AppSnackBar.showError(
        context,
        detailsState.detailsError ?? 'Still loading this pool — try again.',
      );
      context.read<PoolDetailsBloc>().add(
        PoolDetailsEvent.fetchRequested(widget.poolId),
      );
      return;
    }

    final formState = context.read<JoinPoolFormBloc>().state;
    context.read<JoinPoolBloc>().add(
      JoinPoolEvent.submitRequested(
        JoinPoolRequest(
          id: widget.poolId,
          bankName: formState.bank!.name,
          bankCode: formState.bank!.code,
          accountNumber: formState.accountNumber,
          accountName: formState.resolvedAccount!.accountName,
          // amountPerSlot 0 for uneven pools — amount chosen at payment.
          memberShareAmount: details.amountPerSlot,
        ),
      ),
    );
  }

  /// Every path out pops details with `true` so figures refresh after join/pay.
  Future<void> _showReviewSheet(BuildContext context) async {
    final detailsState = context.read<PoolDetailsBloc>().state;
    final details = detailsState.details!;
    final leaders = detailsState.members.where(
      (m) => m.userId == details.leaderId,
    );

    final continueToPayment = await JoinPoolReviewSheet.show(
      context,
      details: details,
      leaderName: leaders.isEmpty ? null : leaders.first.name,
      formState: context.read<JoinPoolFormBloc>().state,
    );

    if (!context.mounted) return;
    if (continueToPayment == true) {
      // Pop deferred to payment listener — page stays under checkout.
      context.read<PoolPaymentBloc>().add(
        PoolPaymentEvent.payRequested(
          PoolPaymentRequest(
            poolId: widget.poolId,
            amount: details.amountPerSlot,
          ),
        ),
      );
    } else {
      // Already joined — home shows the updated pool list.
      const HomeRoute().go(context);
    }
  }

  Future<void> _onPaymentStatusChanged(
    BuildContext context,
    PoolPaymentState state,
  ) async {
    switch (state.status) {
      case PoolPaymentRequestStatus.success:
        final payment = state.payment!;
        context.read<PoolPaymentBloc>().add(
          const PoolPaymentEvent.stateCleared(),
        );
        await PaymentCheckoutRoute(
          poolId: widget.poolId,
          checkoutUrl: payment.checkoutUrl,
        ).push<bool>(context);
        if (context.mounted) context.pop(true);
      case PoolPaymentRequestStatus.failure:
        // Re-join would fail — pop to details where CTA is "Continue to payment".
        AppSnackBar.showError(
          context,
          state.error ?? 'Could not start this payment',
        );
        context.read<PoolPaymentBloc>().add(
          const PoolPaymentEvent.stateCleared(),
        );
        context.pop(true);
      case PoolPaymentRequestStatus.confirmed:
        context.read<PoolPaymentBloc>().add(const PoolPaymentEvent.stateCleared());
        if (context.canPop()) context.pop(true);
      case PoolPaymentRequestStatus.initial:
      case PoolPaymentRequestStatus.loading:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<JoinPoolFormBloc>()),
        BlocProvider.value(value: getIt<JoinPoolBloc>()),
        BlocProvider(
          create: (_) =>
              getIt<PoolDetailsBloc>()
                ..add(PoolDetailsEvent.fetchRequested(widget.poolId)),
        ),
        BlocProvider(create: (_) => getIt<PoolPaymentBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<JoinPoolFormBloc, JoinPoolFormState>(
            listenWhen: (previous, current) =>
                previous.bank != current.bank ||
                previous.accountNumber != current.accountNumber,
            listener: (context, state) {
              final joinPoolBloc = context.read<JoinPoolBloc>();
              if (state.canLookupAccount) {
                joinPoolBloc.add(
                  JoinPoolEvent.accountLookupRequested(
                    accountNumber: state.accountNumber,
                    bankCode: state.bank!.code,
                  ),
                );
              } else {
                joinPoolBloc.add(const JoinPoolEvent.accountLookupCleared());
              }
            },
          ),
          BlocListener<JoinPoolBloc, JoinPoolState>(
            listenWhen: (previous, current) =>
                previous.resolvedAccount != current.resolvedAccount,
            listener: (context, state) => context.read<JoinPoolFormBloc>().add(
              JoinPoolFormEvent.accountLookupResultChanged(
                state.resolvedAccount,
              ),
            ),
          ),
          BlocListener<JoinPoolBloc, JoinPoolState>(
            listenWhen: (previous, current) =>
                previous.joinStatus != current.joinStatus,
            listener: (context, state) {
              switch (state.joinStatus) {
                case JoinPoolRequestStatus.success:
                  _showReviewSheet(context);
                case JoinPoolRequestStatus.failure:
                  AppSnackBar.showError(
                    context,
                    state.joinError ?? 'Could not join this pool',
                  );
                case JoinPoolRequestStatus.initial:
                case JoinPoolRequestStatus.loading:
                  break;
              }
            },
          ),
          BlocListener<PoolPaymentBloc, PoolPaymentState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: _onPaymentStatusChanged,
          ),
        ],
        child: AppScaffold(
          body: Builder(
            builder: (context) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.s16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppBackButton(),
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  Text('Join pool', style: context.styles.h4),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    "Contribute to a shared goal. If it doesn't fill by the "
                    'deadline, your money returns to you automatically.',
                    style: context.styles.bodyL,
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  BlocBuilder<JoinPoolBloc, JoinPoolState>(
                    buildWhen: (previous, current) =>
                        previous.banksStatus != current.banksStatus,
                    builder: (context, banksState) =>
                        BlocSelector<
                          JoinPoolFormBloc,
                          JoinPoolFormState,
                          Bank?
                        >(
                          selector: (state) => state.bank,
                          builder: (context, bank) => AppDropdownField<Bank>(
                            label: 'Your bank',
                            canSearch: true,
                            hint:
                                banksState.banksStatus ==
                                    JoinPoolRequestStatus.loading
                                ? 'Loading banks…'
                                : 'Select bank',
                            items: banksState.banks,
                            itemLabel: (b) => b.name,
                            value: bank,
                            errorText:
                                banksState.banksStatus ==
                                    JoinPoolRequestStatus.failure
                                ? banksState.banksError
                                : null,
                            onChanged: (value) {
                              if (value == null) return;
                              context.read<JoinPoolFormBloc>().add(
                                JoinPoolFormEvent.bankChanged(value),
                              );
                            },
                          ),
                        ),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  AppTextField(
                    label: 'Account number',
                    hint: 'Enter account number',
                    controller: _accountController,
                    validator: AppValidators.accountNumber,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<JoinPoolFormBloc>().add(
                      JoinPoolFormEvent.accountNumberChanged(value),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    textInputAction: TextInputAction.done,
                  ),
                  const _AccountLookupFeedback(),
                  _JoinPoolButton(onPressed: () => _onJoinPool(context)),
                  const SizedBox(height: AppSpacing.s24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountLookupFeedback extends StatelessWidget {
  const _AccountLookupFeedback();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinPoolBloc, JoinPoolState>(
      buildWhen: (previous, current) =>
          previous.accountLookupStatus != current.accountLookupStatus ||
          previous.resolvedAccount != current.resolvedAccount ||
          previous.accountLookupError != current.accountLookupError,
      builder: (context, state) {
        final Widget? feedback = switch (state.accountLookupStatus) {
          JoinPoolRequestStatus.initial => null,
          JoinPoolRequestStatus.loading => Text(
            'Verifying account…',
            style: context.styles.bodyS.copyWith(
              color: context.colors.text.subtle,
            ),
          ),
          JoinPoolRequestStatus.success =>
            BlocSelector<JoinPoolFormBloc, JoinPoolFormState, Bank?>(
              selector: (formState) => formState.bank,
              builder: (context, bank) => AccountVerifiedCard(
                accountName: state.resolvedAccount?.accountName ?? '',
                bankName: bank?.name,
              ),
            ),
          JoinPoolRequestStatus.failure => Text(
            state.accountLookupError ?? 'Could not verify this account',
            style: context.styles.bodyS.copyWith(
              color: context.colors.state.errorBase,
            ),
          ),
        };

        if (feedback == null) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(top: AppSpacing.s16),
          child: feedback,
        );
      },
    );
  }
}

class _JoinPoolButton extends StatelessWidget {
  const _JoinPoolButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JoinPoolFormBloc, JoinPoolFormState, bool>(
      selector: (state) => state.canSubmit,
      builder: (context, canSubmit) {
        if (!canSubmit) return const SizedBox.shrink();

        return BlocSelector<JoinPoolBloc, JoinPoolState, bool>(
          selector: (state) =>
              state.joinStatus == JoinPoolRequestStatus.loading,
          builder: (context, isSubmitting) =>
              BlocSelector<PoolPaymentBloc, PoolPaymentState, bool>(
                selector: (state) =>
                    state.status == PoolPaymentRequestStatus.loading,
                builder: (context, isStartingPayment) =>
                    BlocSelector<PoolDetailsBloc, PoolDetailsState, bool>(
                      selector: (state) =>
                          state.detailsStatus ==
                              PoolDetailsRequestStatus.initial ||
                          state.detailsStatus ==
                              PoolDetailsRequestStatus.loading,
                      builder: (context, isLoadingDetails) => Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.s32),
                        child: AppButton(
                          label: 'Join pool',
                          loading:
                              isSubmitting ||
                              isStartingPayment ||
                              isLoadingDetails,
                          onPressed: onPressed,
                        ),
                      ),
                    ),
              ),
        );
      },
    );
  }
}
