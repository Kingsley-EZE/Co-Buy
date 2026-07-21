import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/common/app_back_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_transactions_bloc/pool_transactions_bloc.dart';
import 'package:co_buy/features/pools/presentation/widgets/pool_transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PoolTransactionsPage extends StatelessWidget {
  const PoolTransactionsPage({super.key, required this.poolId});

  final String poolId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PoolTransactionsBloc>()
        ..add(PoolTransactionsEvent.fetchRequested(poolId)),
      child: _PoolTransactionsView(poolId: poolId),
    );
  }
}

class _PoolTransactionsView extends StatelessWidget {
  const _PoolTransactionsView({required this.poolId});

  final String poolId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenH,
              AppSpacing.s16,
              AppSpacing.screenH,
              AppSpacing.s8,
            ),
            child: Text('Transactions', style: context.styles.h3),
          ),
          Expanded(
            child: BlocBuilder<PoolTransactionsBloc, PoolTransactionsState>(
              builder: (context, state) => switch (state.status) {
                PoolTransactionsRequestStatus.initial ||
                PoolTransactionsRequestStatus.loading => const Center(
                  child: CircularProgressIndicator(
                    color: AppPalette.primaryBase,
                  ),
                ),
                PoolTransactionsRequestStatus.failure => _ErrorBody(
                  message: state.error ?? 'Something went wrong.',
                  poolId: poolId,
                ),
                PoolTransactionsRequestStatus.success =>
                  state.transactions.isEmpty
                      ? Center(
                          child: Text(
                            'No transactions yet.',
                            style: context.styles.bodyL.copyWith(
                              color: context.colors.text.subtle,
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.screenH,
                            vertical: AppSpacing.s8,
                          ),
                          itemCount: state.transactions.length,
                          separatorBuilder: (_, _) => Divider(
                            height: 1,
                            color: context.colors.stroke.secondary,
                          ),
                          itemBuilder: (context, index) => PoolTransactionTile(
                            transaction: state.transactions[index],
                          ),
                        ),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.poolId});

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
              onPressed: () => context.read<PoolTransactionsBloc>().add(
                PoolTransactionsEvent.fetchRequested(poolId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
