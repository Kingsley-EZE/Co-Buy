import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_dropdown_field.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/common/app_text_area.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_bloc/create_pool_bloc.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/pool_summary_sheet.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Full-screen form to start a new pool.
class CreatePoolPage extends StatefulWidget {
  const CreatePoolPage({super.key});

  @override
  State<CreatePoolPage> createState() => _CreatePoolPageState();
}

class _CreatePoolPageState extends State<CreatePoolPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _slotsController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _accountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final createPoolBloc = getIt<CreatePoolBloc>();
    // No-ops when the singleton already holds the cached lists.
    createPoolBloc.add(const CreatePoolEvent.banksFetchRequested());
    createPoolBloc.add(const CreatePoolEvent.categoriesFetchRequested());
    // The singleton outlives the page — drop a previous visit's resolution
    // and submission outcome so a fresh, empty form starts clean.
    createPoolBloc.add(const CreatePoolEvent.accountLookupCleared());
    createPoolBloc.add(const CreatePoolEvent.submitStateCleared());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _slotsController.dispose();
    _deadlineController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  /// Date then time, combined into one deadline. The picked value renders in
  /// the read-only field via the controller; the bloc keeps the [DateTime].
  Future<void> _pickDeadline(BuildContext context) async {
    final bloc = context.read<CreatePoolFormBloc>();
    final now = DateTime.now();
    final initial = bloc.state.deadline ?? now;

    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (date == null || !context.mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null || !context.mounted) return;

    final deadline = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    final localizations = MaterialLocalizations.of(context);
    _deadlineController.text =
        '${localizations.formatMediumDate(deadline)}, '
        '${localizations.formatTimeOfDay(time)}';
    bloc.add(CreatePoolFormEvent.deadlineChanged(deadline));
  }

  void _onStartPool(BuildContext context) {
    final formBloc = context.read<CreatePoolFormBloc>();
    final createPoolBloc = context.read<CreatePoolBloc>();

    PoolSummarySheet.show(
      context,
      formState: formBloc.state,
      onCreatePool: () => createPoolBloc.add(
        CreatePoolEvent.submitRequested(formBloc.state.toCreatePoolRequest()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CreatePoolFormBloc>()),
        // `.value` because get_it owns the singleton's lifecycle.
        BlocProvider.value(value: getIt<CreatePoolBloc>()),
      ],
      // The form bloc owns the inputs and the feature bloc owns the network
      // call, so the page bridges them both ways: whenever bank/account
      // number settle into a valid pair the enquiry fires (and a stale
      // resolution is dropped when they stop being valid), and the enquiry
      // result is mirrored back so `canSubmit` can require verification.
      child: MultiBlocListener(
        listeners: [
          BlocListener<CreatePoolFormBloc, CreatePoolFormState>(
            listenWhen: (previous, current) =>
                previous.bank != current.bank ||
                previous.accountNumber != current.accountNumber,
            listener: (context, state) {
              final createPoolBloc = context.read<CreatePoolBloc>();
              if (state.canLookupAccount) {
                createPoolBloc.add(
                  CreatePoolEvent.accountLookupRequested(
                    accountNumber: state.accountNumber,
                    bankCode: state.bank!.code,
                  ),
                );
              } else {
                createPoolBloc.add(
                  const CreatePoolEvent.accountLookupCleared(),
                );
              }
            },
          ),
          BlocListener<CreatePoolBloc, CreatePoolState>(
            listenWhen: (previous, current) =>
                previous.resolvedAccount != current.resolvedAccount,
            listener: (context, state) =>
                context.read<CreatePoolFormBloc>().add(
                  CreatePoolFormEvent.accountLookupResultChanged(
                    state.resolvedAccount,
                  ),
                ),
          ),
          BlocListener<CreatePoolBloc, CreatePoolState>(
            listenWhen: (previous, current) =>
                previous.createPoolStatus != current.createPoolStatus,
            listener: (context, state) {
              switch (state.createPoolStatus) {
                case CreatePoolRequestStatus.success:
                  AppSnackBar.showSuccess(context, 'Pool created successfully');
                  context.pop();
                case CreatePoolRequestStatus.failure:
                  AppSnackBar.showError(
                    context,
                    state.createPoolError ?? 'Could not create the pool',
                  );
                case CreatePoolRequestStatus.initial:
                case CreatePoolRequestStatus.loading:
                  break;
              }
            },
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
                  Text('Start a pool', style: context.styles.h4),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    'Set a goal, invite your people, watch it come together.',
                    style: context.styles.bodyL,
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  AppTextField(
                    label: "What's this pool for?",
                    hint: 'e.g. Mama Gold rice 50kg — 10 bags',
                    controller: _titleController,
                    onChanged: (value) => context
                        .read<CreatePoolFormBloc>()
                        .add(CreatePoolFormEvent.titleChanged(value)),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  AppTextArea(
                    label: 'Description (optional)',
                    hint: "Describe this pool's goal",
                    controller: _descriptionController,
                    maxLength: kPoolDescriptionMaxLength,
                    onChanged: (value) => context
                        .read<CreatePoolFormBloc>()
                        .add(CreatePoolFormEvent.descriptionChanged(value)),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  BlocBuilder<CreatePoolBloc, CreatePoolState>(
                    buildWhen: (previous, current) =>
                        previous.categoriesStatus != current.categoriesStatus,
                    builder: (context, categoriesState) =>
                        BlocSelector<
                          CreatePoolFormBloc,
                          CreatePoolFormState,
                          PoolCategory?
                        >(
                          selector: (state) => state.category,
                          builder: (context, category) =>
                              AppDropdownField<PoolCategory>(
                                label: 'Category',
                                hint:
                                    categoriesState.categoriesStatus ==
                                        CreatePoolRequestStatus.loading
                                    ? 'Loading categories…'
                                    : 'Select a category',
                                items: categoriesState.categories,
                                itemLabel: (c) => c.displayName,
                                value: category,
                                errorText:
                                    categoriesState.categoriesStatus ==
                                        CreatePoolRequestStatus.failure
                                    ? categoriesState.categoriesError
                                    : null,
                                onChanged: (value) {
                                  if (value == null) return;
                                  context.read<CreatePoolFormBloc>().add(
                                    CreatePoolFormEvent.categoryChanged(value),
                                  );
                                },
                              ),
                        ),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  BlocSelector<CreatePoolFormBloc, CreatePoolFormState, bool?>(
                    selector: (state) => state.evenContribution,
                    builder: (context, evenContribution) =>
                        AppDropdownField<bool>(
                          label: 'Even Contribution?',
                          hint: 'defaults to Equal slot',
                          items: const [true, false],
                          itemLabel: (even) => even ? 'Yes' : 'No',
                          value: evenContribution,
                          onChanged: (value) {
                            if (value == null) return;
                            context.read<CreatePoolFormBloc>().add(
                              CreatePoolFormEvent.evenContributionChanged(
                                value,
                              ),
                            );
                          },
                        ),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          label: 'Target Amount',
                          hint: 'e.g. ₦5,000',
                          controller: _amountController,
                          onChanged: (value) =>
                              context.read<CreatePoolFormBloc>().add(
                                CreatePoolFormEvent.targetAmountChanged(value),
                              ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s16),
                      Expanded(
                        child: AppTextField(
                          label: 'Number of slots',
                          hint: 'e.g. 10',
                          controller: _slotsController,
                          onChanged: (value) => context
                              .read<CreatePoolFormBloc>()
                              .add(CreatePoolFormEvent.slotsChanged(value)),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  AppTextField(
                    label: 'Deadline',
                    hint: 'Select a date and time',
                    controller: _deadlineController,
                    readOnly: true,
                    onTap: () => _pickDeadline(context),
                    suffix: Padding(
                      padding: const EdgeInsets.all(AppSpacing.s12),
                      child: Assets.icons.icMiniCalendar.svg(
                        width: AppSpacing.s20,
                        height: AppSpacing.s20,
                        colorFilter: ColorFilter.mode(
                          context.colors.text.subtle,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  Text(
                    'BENEFICIARY INFORMATION',
                    style: context.styles.bodyL.semibold,
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  BlocBuilder<CreatePoolBloc, CreatePoolState>(
                    buildWhen: (previous, current) =>
                        previous.banksStatus != current.banksStatus,
                    builder: (context, banksState) =>
                        BlocSelector<
                          CreatePoolFormBloc,
                          CreatePoolFormState,
                          Bank?
                        >(
                          selector: (state) => state.bank,
                          builder: (context, bank) => AppDropdownField<Bank>(
                            label: "Beneficiary's bank",
                            canSearch: true,
                            hint:
                                banksState.banksStatus ==
                                    CreatePoolRequestStatus.loading
                                ? 'Loading banks…'
                                : 'Select bank',
                            items: banksState.banks,
                            itemLabel: (b) => b.name,
                            value: bank,
                            errorText:
                                banksState.banksStatus ==
                                    CreatePoolRequestStatus.failure
                                ? banksState.banksError
                                : null,
                            onChanged: (value) {
                              if (value == null) return;
                              context.read<CreatePoolFormBloc>().add(
                                CreatePoolFormEvent.bankChanged(value),
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
                    onChanged: (value) => context
                        .read<CreatePoolFormBloc>()
                        .add(CreatePoolFormEvent.accountNumberChanged(value)),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    textInputAction: TextInputAction.done,
                  ),
                  const _AccountLookupStatusLine(),
                  const _RecipientReceivesField(),
                  const SizedBox(height: AppSpacing.s32),
                  BlocSelector<CreatePoolBloc, CreatePoolState, bool>(
                    selector: (state) =>
                        state.createPoolStatus ==
                        CreatePoolRequestStatus.loading,
                    builder: (context, isSubmitting) =>
                        BlocSelector<
                          CreatePoolFormBloc,
                          CreatePoolFormState,
                          bool
                        >(
                          selector: (state) => state.canSubmit,
                          builder: (context, canSubmit) => AppButton(
                            label: 'Start pool',
                            loading: isSubmitting,
                            onPressed: canSubmit
                                ? () => _onStartPool(context)
                                : null,
                          ),
                        ),
                  ),
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

/// Feedback under the account number field for the bank name enquiry:
/// nothing until a lookup runs, then progress, the resolved account name,
/// or the failure message.
class _AccountLookupStatusLine extends StatelessWidget {
  const _AccountLookupStatusLine();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePoolBloc, CreatePoolState>(
      buildWhen: (previous, current) =>
          previous.accountLookupStatus != current.accountLookupStatus ||
          previous.resolvedAccount != current.resolvedAccount ||
          previous.accountLookupError != current.accountLookupError,
      builder: (context, state) {
        final Widget? line = switch (state.accountLookupStatus) {
          CreatePoolRequestStatus.initial => null,
          CreatePoolRequestStatus.loading => Text(
            'Verifying account…',
            style: context.styles.bodyS.copyWith(
              color: context.colors.text.subtle,
            ),
          ),
          CreatePoolRequestStatus.success => Text(
            state.resolvedAccount?.accountName ?? '',
            style: context.styles.bodyS.semibold.copyWith(
              color: context.colors.state.successBase,
            ),
          ),
          CreatePoolRequestStatus.failure => Text(
            state.accountLookupError ?? 'Could not verify this account',
            style: context.styles.bodyS.copyWith(
              color: context.colors.state.errorBase,
            ),
          ),
        };

        if (line == null) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(top: AppSpacing.s8),
          child: line,
        );
      },
    );
  }
}

/// Read-only payout preview, shown only once the name enquiry has resolved
/// the beneficiary: the target amount minus the [kPoolFeeRate] fee, with a
/// note explaining the deduction.
class _RecipientReceivesField extends StatelessWidget {
  const _RecipientReceivesField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreatePoolBloc, CreatePoolState, bool>(
      selector: (state) =>
          state.accountLookupStatus == CreatePoolRequestStatus.success,
      builder: (context, lookupSucceeded) {
        if (!lookupSucceeded) return const SizedBox.shrink();

        return BlocSelector<CreatePoolFormBloc, CreatePoolFormState, double?>(
          selector: (state) => state.recipientReceivesAmount,
          builder: (context, amount) {
            if (amount == null) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.s24),
                AppTextField(
                  // initialValue only applies on first build; keying by the
                  // amount recreates the field when the target changes.
                  key: ValueKey(amount),
                  label: 'Recipient receives',
                  initialValue: AppFormatters.naira(amount),
                  enabled: false,
                ),
                const SizedBox(height: AppSpacing.s12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: AppSpacing.s20,
                      color: context.colors.text.body,
                    ),
                    const SizedBox(width: AppSpacing.s8),
                    Expanded(
                      child: Text(
                        'This is the amount paid to the recipient after '
                        'the ${(kPoolFeeRate * 100).toStringAsFixed(0)}% '
                        'is deducted.',
                        style: context.styles.bodyM,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
