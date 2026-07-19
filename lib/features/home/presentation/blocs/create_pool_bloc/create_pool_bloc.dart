import 'dart:async';

import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/usecases/get_banks_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/lookup_account_name_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_pool_event.dart';
part 'create_pool_state.dart';
part 'create_pool_bloc.freezed.dart';

/// Dispose hook so get_it closes the bloc if the container is ever reset
/// (e.g. in tests) — in the running app it lives for the app's lifetime.
FutureOr<void> disposeCreatePoolBloc(CreatePoolBloc bloc) => bloc.close();

/// Feature bloc for the create-pool flow. Registered app-wide (not
/// page-scoped) so the fetched bank list — static reference data — is cached
/// for the app's lifetime: reopening create-pool reuses it instead of
/// refetching.
@LazySingleton(dispose: disposeCreatePoolBloc)
class CreatePoolBloc extends Bloc<CreatePoolEvent, CreatePoolState> {
  CreatePoolBloc(this._getBanksUseCase, this._lookupAccountNameUseCase)
    : super(const CreatePoolState()) {
    on<CreatePoolBanksFetchRequested>(_onBanksFetchRequested);
    on<CreatePoolAccountLookupRequested>(_onAccountLookupRequested);
    on<CreatePoolAccountLookupCleared>(_onAccountLookupCleared);
  }

  final GetBanksUseCase _getBanksUseCase;
  final LookupAccountNameUseCase _lookupAccountNameUseCase;

  Future<void> _onBanksFetchRequested(
    CreatePoolBanksFetchRequested event,
    Emitter<CreatePoolState> emit,
  ) async {
    // Cache hit: the list is already in memory, don't touch the network.
    // A failure is deliberately not cached so re-dispatching retries.
    if (state.banksStatus == CreatePoolRequestStatus.success) return;

    emit(
      state.copyWith(
        banksStatus: CreatePoolRequestStatus.loading,
        banksError: null,
      ),
    );

    final result = await _getBanksUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          banksStatus: CreatePoolRequestStatus.failure,
          banksError: failure.message,
        ),
      ),
      (banks) => emit(
        state.copyWith(
          banksStatus: CreatePoolRequestStatus.success,
          banks: banks,
        ),
      ),
    );
  }

  Future<void> _onAccountLookupRequested(
    CreatePoolAccountLookupRequested event,
    Emitter<CreatePoolState> emit,
  ) async {
    emit(
      state.copyWith(
        accountLookupStatus: CreatePoolRequestStatus.loading,
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
          accountLookupStatus: CreatePoolRequestStatus.failure,
          accountLookupError: failure.message,
        ),
      ),
      (account) => emit(
        state.copyWith(
          accountLookupStatus: CreatePoolRequestStatus.success,
          resolvedAccount: account,
        ),
      ),
    );
  }

  void _onAccountLookupCleared(
    CreatePoolAccountLookupCleared event,
    Emitter<CreatePoolState> emit,
  ) {
    if (state.accountLookupStatus == CreatePoolRequestStatus.initial) return;

    emit(
      state.copyWith(
        accountLookupStatus: CreatePoolRequestStatus.initial,
        resolvedAccount: null,
        accountLookupError: null,
      ),
    );
  }
}
