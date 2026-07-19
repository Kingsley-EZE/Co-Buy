import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';
import 'package:co_buy/features/pools/domain/usecases/get_pool_details_usecase.dart';
import 'package:co_buy/features/pools/domain/usecases/get_pool_members_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pool_details_event.dart';
part 'pool_details_state.dart';
part 'pool_details_bloc.freezed.dart';

/// Feature bloc for the pool details screen. Page-scoped: details are live
/// data for one pool, so every visit fetches fresh.
@injectable
class PoolDetailsBloc extends Bloc<PoolDetailsEvent, PoolDetailsState> {
  PoolDetailsBloc(this._getPoolDetailsUseCase, this._getPoolMembersUseCase)
    : super(const PoolDetailsState()) {
    on<PoolDetailsFetchRequested>(_onFetchRequested);
  }

  final GetPoolDetailsUseCase _getPoolDetailsUseCase;
  final GetPoolMembersUseCase _getPoolMembersUseCase;

  Future<void> _onFetchRequested(
    PoolDetailsFetchRequested event,
    Emitter<PoolDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        detailsStatus: PoolDetailsRequestStatus.loading,
        detailsError: null,
        membersStatus: PoolDetailsRequestStatus.loading,
        membersError: null,
      ),
    );

    // The two endpoints are independent — fetch them concurrently so the
    // screen isn't gated on sequential round trips.
    final (detailsResult, membersResult) = await (
      _getPoolDetailsUseCase(event.poolId),
      _getPoolMembersUseCase(event.poolId),
    ).wait;

    detailsResult.fold(
      (failure) => emit(
        state.copyWith(
          detailsStatus: PoolDetailsRequestStatus.failure,
          detailsError: failure.message,
        ),
      ),
      (details) => emit(
        state.copyWith(
          detailsStatus: PoolDetailsRequestStatus.success,
          details: details,
        ),
      ),
    );

    membersResult.fold(
      (failure) => emit(
        state.copyWith(
          membersStatus: PoolDetailsRequestStatus.failure,
          membersError: failure.message,
        ),
      ),
      (members) => emit(
        state.copyWith(
          membersStatus: PoolDetailsRequestStatus.success,
          members: members,
        ),
      ),
    );
  }
}
