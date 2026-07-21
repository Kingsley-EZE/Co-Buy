import 'dart:async';

import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/entities/create_pool_request.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:co_buy/features/home/domain/usecases/create_pool_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/get_banks_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/get_categories_usecase.dart';
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

/// App-wide singleton — caches bank/category lists for the app's lifetime.
@LazySingleton(dispose: disposeCreatePoolBloc)
class CreatePoolBloc extends Bloc<CreatePoolEvent, CreatePoolState> {
  CreatePoolBloc(
    this._getBanksUseCase,
    this._getCategoriesUseCase,
    this._lookupAccountNameUseCase,
    this._createPoolUseCase,
  ) : super(const CreatePoolState()) {
    on<CreatePoolBanksFetchRequested>(_onBanksFetchRequested);
    on<CreatePoolCategoriesFetchRequested>(_onCategoriesFetchRequested);
    on<CreatePoolAccountLookupRequested>(_onAccountLookupRequested);
    on<CreatePoolAccountLookupCleared>(_onAccountLookupCleared);
    on<CreatePoolSubmitRequested>(_onSubmitRequested);
    on<CreatePoolSubmitStateCleared>(_onSubmitStateCleared);
  }

  final GetBanksUseCase _getBanksUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final LookupAccountNameUseCase _lookupAccountNameUseCase;
  final CreatePoolUseCase _createPoolUseCase;

  Future<void> _onBanksFetchRequested(
    CreatePoolBanksFetchRequested event,
    Emitter<CreatePoolState> emit,
  ) async {
    // Cache hit — failures are not cached so re-dispatch retries.
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

  Future<void> _onCategoriesFetchRequested(
    CreatePoolCategoriesFetchRequested event,
    Emitter<CreatePoolState> emit,
  ) async {
    // Cache hit — failures are not cached so re-dispatch retries.
    if (state.categoriesStatus == CreatePoolRequestStatus.success) return;

    emit(
      state.copyWith(
        categoriesStatus: CreatePoolRequestStatus.loading,
        categoriesError: null,
      ),
    );

    final result = await _getCategoriesUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          categoriesStatus: CreatePoolRequestStatus.failure,
          categoriesError: failure.message,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          categoriesStatus: CreatePoolRequestStatus.success,
          categories: categories,
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

  Future<void> _onSubmitRequested(
    CreatePoolSubmitRequested event,
    Emitter<CreatePoolState> emit,
  ) async {
    emit(
      state.copyWith(
        createPoolStatus: CreatePoolRequestStatus.loading,
        createPoolError: null,
      ),
    );

    final result = await _createPoolUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          createPoolStatus: CreatePoolRequestStatus.failure,
          createPoolError: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(createPoolStatus: CreatePoolRequestStatus.success),
      ),
    );
  }

  void _onSubmitStateCleared(
    CreatePoolSubmitStateCleared event,
    Emitter<CreatePoolState> emit,
  ) {
    if (state.createPoolStatus == CreatePoolRequestStatus.initial) return;

    emit(
      state.copyWith(
        createPoolStatus: CreatePoolRequestStatus.initial,
        createPoolError: null,
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
