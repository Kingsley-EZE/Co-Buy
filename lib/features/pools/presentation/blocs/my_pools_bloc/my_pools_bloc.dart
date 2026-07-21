import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../home/domain/entities/pool.dart';
import '../../../domain/usecases/get_my_pools_usecase.dart';

part 'my_pools_event.dart';
part 'my_pools_state.dart';
part 'my_pools_bloc.freezed.dart';

/// Page-scoped: the My pools tab owns its list, so a fresh instance per visit
/// is fine (unlike the app-wide home feed).
@injectable
class MyPoolsBloc extends Bloc<MyPoolsEvent, MyPoolsState> {
  MyPoolsBloc(this._getMyPoolsUseCase) : super(const MyPoolsState()) {
    on<MyPoolsFetchRequested>(_onFetchRequested);
  }

  final GetMyPoolsUseCase _getMyPoolsUseCase;

  Future<void> _onFetchRequested(
    MyPoolsFetchRequested event,
    Emitter<MyPoolsState> emit,
  ) async {
    emit(state.copyWith(status: MyPoolsRequestStatus.loading, error: null));

    final result = await _getMyPoolsUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MyPoolsRequestStatus.failure,
          error: failure.message,
        ),
      ),
      (pools) => emit(
        state.copyWith(status: MyPoolsRequestStatus.success, pools: pools),
      ),
    );
  }
}
