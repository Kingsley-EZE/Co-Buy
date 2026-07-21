import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:co_buy/features/pools/domain/entities/pool_payment.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_details_bloc/pool_details_bloc.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_payment_bloc/pool_payment_bloc.dart';
import 'package:co_buy/features/pools/presentation/widgets/pool_destination_card.dart';
import 'package:co_buy/features/pools/presentation/widgets/pool_member_tile.dart';
import 'package:co_buy/features/pools/presentation/widgets/pool_raised_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Full-screen details for one pool: what's being raised, where the money
/// goes and who holds each slot. Pool and members load from two independent
/// endpoints, so the members section has its own loading/error area.
class PoolDetailsPage extends StatelessWidget {
  const PoolDetailsPage({super.key, required this.poolId});

  final String poolId;

  /// Success hands the checkout URLs to the webview; whatever result that
  /// pops with, the details refetch — the payment may have settled
  /// server-side even if the user backed out, and a refetch self-corrects.
  Future<void> _onPaymentStatusChanged(
    BuildContext context,
    PoolPaymentState state,
  ) async {
    switch (state.status) {
      case PoolPaymentRequestStatus.success:
        // Set exactly while status is success, and cleared only below.
        final payment = state.payment!;
        context.read<PoolPaymentBloc>().add(
          const PoolPaymentEvent.stateCleared(),
        );
        await PaymentCheckoutRoute(
          poolId: poolId,
          checkoutUrl: payment.checkoutUrl,
          redirectUrl: 'https://www.avenyhq.com',//payment.redirectUrl,
        ).push<bool>(context);
        if (context.mounted) {
          context.read<PoolDetailsBloc>().add(
            PoolDetailsEvent.fetchRequested(poolId),
          );
        }
      case PoolPaymentRequestStatus.failure:
        AppSnackBar.showError(
          context,
          state.error ?? 'Could not start this payment',
        );
        context.read<PoolPaymentBloc>().add(
          const PoolPaymentEvent.stateCleared(),
        );
      case PoolPaymentRequestStatus.initial:
      case PoolPaymentRequestStatus.loading:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<PoolDetailsBloc>()
                ..add(PoolDetailsEvent.fetchRequested(poolId))
                ..add(PoolDetailsEvent.socketStarted(poolId)),
        ),
        BlocProvider(create: (_) => getIt<PoolPaymentBloc>()),
      ],
      child: BlocListener<PoolPaymentBloc, PoolPaymentState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _onPaymentStatusChanged,
        child: AppScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.s16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppBackButton(),
                ),
              ),
              Expanded(
                child: BlocBuilder<PoolDetailsBloc, PoolDetailsState>(
                  builder: (context, state) {
                    final details = state.details;
                    return switch (state.detailsStatus) {
                      PoolDetailsRequestStatus.initial ||
                      PoolDetailsRequestStatus.loading => const Center(
                        child: CircularProgressIndicator(
                          color: AppPalette.primaryBase,
                        ),
                      ),
                      PoolDetailsRequestStatus.failure => _DetailsError(
                        message: state.detailsError ?? 'Something went wrong.',
                        poolId: poolId,
                      ),
                      PoolDetailsRequestStatus.success => _DetailsContent(
                        details: details!,
                        state: state,
                        poolId: poolId,
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  const _DetailsContent({
    required this.details,
    required this.state,
    required this.poolId,
  });

  final PoolDetails details;
  final PoolDetailsState state;
  final String poolId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.s16,
            ),
            children: [
              _PoolHeader(details: details),
              const SizedBox(height: AppSpacing.s16),
              PoolRaisedCard(details: details),
              const SizedBox(height: AppSpacing.s24),
              const _SectionHeader('DESTINATION INFORMATION'),
              const SizedBox(height: AppSpacing.s12),
              PoolDestinationCard(details: details),
              const SizedBox(height: AppSpacing.s24),
              _SectionHeader(state.membersHeader),
              const SizedBox(height: AppSpacing.s4),
              ..._buildMembersSection(context),
              const SizedBox(height: AppSpacing.s24),
            ],
          ),
        ),
        // Join CTA for signed-in non-members (or members who haven't paid),
        // only while the pool is still OPEN. A member with an unpaid slot has
        // already joined, so their CTA continues to payment instead.
        BlocSelector<AuthBloc, AuthState, String?>(
          selector: (auth) => auth is AuthAuthenticated ? auth.user.id : null,
          builder: (context, userId) {
            if (!state.canJoin(userId)) return const SizedBox.shrink();
            final hasUnpaidSlot = state.hasUnpaidSlot(userId);
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenH,
                AppSpacing.s8,
                AppSpacing.screenH,
                AppSpacing.s16,
              ),
              child: BlocSelector<PoolPaymentBloc, PoolPaymentState, bool>(
                selector: (payment) =>
                    payment.status == PoolPaymentRequestStatus.loading,
                builder: (context, isStartingPayment) => AppButton(
                  label: hasUnpaidSlot ? 'Continue to payment' : 'Join pool',
                  size: AppButtonSize.large,
                  loading: isStartingPayment,
                  onPressed: hasUnpaidSlot
                      // The page's payment listener takes it from here:
                      // checkout webview on success, snackbar on failure.
                      ? () => context.read<PoolPaymentBloc>().add(
                          PoolPaymentEvent.payRequested(
                            PoolPaymentRequest(
                              poolId: poolId,
                              amount: details.amountPerSlot,
                            ),
                          ),
                        )
                      : () async {
                          // The join page pops with `true` after a successful
                          // join — refetch so the raised amount, slots, and
                          // members reflect the new membership.
                          final joined = await JoinPoolRoute(
                            poolId: poolId,
                          ).push<bool>(context);
                          if (joined == true && context.mounted) {
                            context.read<PoolDetailsBloc>().add(
                              PoolDetailsEvent.fetchRequested(poolId),
                            );
                          }
                        },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildMembersSection(BuildContext context) {
    switch (state.membersStatus) {
      case PoolDetailsRequestStatus.initial:
      case PoolDetailsRequestStatus.loading:
        return const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.s24),
            child: Center(
              child: CircularProgressIndicator(color: AppPalette.primaryBase),
            ),
          ),
        ];
      case PoolDetailsRequestStatus.failure:
        return [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
            child: Column(
              children: [
                Text(
                  state.membersError ?? 'Something went wrong.',
                  style: context.styles.bodyL,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.s16),
                AppButton(
                  label: 'Try again',
                  variant: AppButtonVariant.outline,
                  size: AppButtonSize.medium,
                  expanded: false,
                  onPressed: () => context.read<PoolDetailsBloc>().add(
                    PoolDetailsEvent.fetchRequested(poolId),
                  ),
                ),
              ],
            ),
          ),
        ];
      case PoolDetailsRequestStatus.success:
        if (state.members.isEmpty) {
          return [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
              child: Text(
                'No members yet.',
                style: context.styles.bodyL.copyWith(
                  color: context.colors.text.subtle,
                ),
              ),
            ),
          ];
        }
        return [
          for (final (index, member) in state.members.indexed) ...[
            if (index > 0)
              Divider(height: 1, color: context.colors.stroke.secondary),
            PoolMemberTile(
              member: member,
              // The API carries no slot numbers — list order stands in.
              slotNumber: index + 1,
              isLeader: member.userId == details.leaderId,
            ),
          ],
        ];
    }
  }
}

class _DetailsError extends StatelessWidget {
  const _DetailsError({required this.message, required this.poolId});

  final String message;
  final String poolId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: context.styles.bodyL,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.s16),
            AppButton(
              label: 'Try again',
              variant: AppButtonVariant.outline,
              size: AppButtonSize.medium,
              expanded: false,
              onPressed: () => context.read<PoolDetailsBloc>().add(
                PoolDetailsEvent.fetchRequested(poolId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PoolHeader extends StatelessWidget {
  const _PoolHeader({required this.details});

  final PoolDetails details;

  String get _metaLine {
    final category = details.category;
    return [
      'pool #${details.shortCode}',
      if (category != null) category.displayName,
    ].join(' • ');
  }

  @override
  Widget build(BuildContext context) {
    final styles = context.styles;
    final description = details.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(details.name, style: styles.h3),
        if (description != null && description.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s8),
          Text(description, style: styles.bodyL),
        ],
        const SizedBox(height: AppSpacing.s8),
        Text(
          _metaLine,
          style: styles.bodyM.copyWith(color: context.colors.text.subtle),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.styles.bodyL.semibold.copyWith(
        color: context.colors.text.header,
      ),
    );
  }
}
