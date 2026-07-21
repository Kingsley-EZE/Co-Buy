part of 'my_pools_bloc.dart';

enum MyPoolsRequestStatus { initial, loading, success, failure }

@freezed
abstract class MyPoolsState with _$MyPoolsState {
  const factory MyPoolsState({
    @Default(MyPoolsRequestStatus.initial) MyPoolsRequestStatus status,
    @Default(<Pool>[]) List<Pool> pools,
    String? error,
  }) = _MyPoolsState;
}
