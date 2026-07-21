import 'dart:async';

import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/usecases/get_banks_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/lookup_account_name_usecase.dart';
import 'package:co_buy/features/pools/domain/entities/join_pool_request.dart';
import 'package:co_buy/features/pools/domain/usecases/join_pool_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'join_pool_event.dart';
part 'join_pool_state.dart';
part 'join_pool_bloc.freezed.dart';

/// Dispose hook so get_it closes the bloc if the container is ever reset
/// (e.g. in tests) — in the running app it lives for the app's lifetime.
FutureOr<void> disposeJoinPoolBloc(JoinPoolBloc bloc) => bloc.close();

/// App-wide singleton — caches the bank list for the app's lifetime.
@LazySingleton(dispose: disposeJoinPoolBloc)
class JoinPoolBloc extends Bloc<JoinPoolEvent, JoinPoolState> {
  JoinPoolBloc(
    this._getBanksUseCase,
    this._lookupAccountNameUseCase,
    this._joinPoolUseCase,
  ) : super(const JoinPoolState()) {
    on<JoinPoolBanksFetchRequested>(_onBanksFetchRequested);
    on<JoinPoolAccountLookupRequested>(_onAccountLookupRequested);
    on<JoinPoolAccountLookupCleared>(_onAccountLookupCleared);
    on<JoinPoolSubmitRequested>(_onSubmitRequested);
    on<JoinPoolSubmitStateCleared>(_onSubmitStateCleared);
  }

  final GetBanksUseCase _getBanksUseCase;
  final LookupAccountNameUseCase _lookupAccountNameUseCase;
  final JoinPoolUseCase _joinPoolUseCase;

  Future<void> _onBanksFetchRequested(
    JoinPoolBanksFetchRequested event,
    Emitter<JoinPoolState> emit,
  ) async {
    // Cache hit — failures are not cached so re-dispatch retries.
    if (state.banksStatus == JoinPoolRequestStatus.success) return;

    emit(
      state.copyWith(
        banksStatus: JoinPoolRequestStatus.loading,
        banksError: null,
      ),
    );

    final result = await _getBanksUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          banksStatus: JoinPoolRequestStatus.failure,
          banksError: failure.message,
        ),
      ),
      (banks) => emit(
        state.copyWith(
          banksStatus: JoinPoolRequestStatus.success,
          banks: banks,
        ),
      ),
    );
  }

  Future<void> _onAccountLookupRequested(
    JoinPoolAccountLookupRequested event,
    Emitter<JoinPoolState> emit,
  ) async {
    emit(
      state.copyWith(
        accountLookupStatus: JoinPoolRequestStatus.loading,
        resolvedAccount: null,
        accountLookupError: null,
      ),
    );

    final result = await _lookupAccountNameUseCase(
      AccountLookupRequest(
        accountNumber: event.accountNumber,
        bankCode: event.bankCode,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          accountLookupStatus: JoinPoolRequestStatus.failure,
          accountLookupError: failure.message,
        ),
      ),
      (account) => emit(
        state.copyWith(
          accountLookupStatus: JoinPoolRequestStatus.success,
          resolvedAccount: account,
        ),
      ),
    );
  }

  Future<void> _onSubmitRequested(
    JoinPoolSubmitRequested event,
    Emitter<JoinPoolState> emit,
  ) async {
    emit(
      state.copyWith(
        joinStatus: JoinPoolRequestStatus.loading,
        joinError: null,
      ),
    );

    final result = await _joinPoolUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          joinStatus: JoinPoolRequestStatus.failure,
          joinError: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(joinStatus: JoinPoolRequestStatus.success)),
    );
  }

  void _onSubmitStateCleared(
    JoinPoolSubmitStateCleared event,
    Emitter<JoinPoolState> emit,
  ) {
    if (state.joinStatus == JoinPoolRequestStatus.initial) return;

    emit(
      state.copyWith(
        joinStatus: JoinPoolRequestStatus.initial,
        joinError: null,
      ),
    );
  }

  void _onAccountLookupCleared(
    JoinPoolAccountLookupCleared event,
    Emitter<JoinPoolState> emit,
  ) {
    if (state.accountLookupStatus == JoinPoolRequestStatus.initial) return;

    emit(
      state.copyWith(
        accountLookupStatus: JoinPoolRequestStatus.initial,
        resolvedAccount: null,
        accountLookupError: null,
      ),
    );
  }
}
