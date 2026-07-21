part of 'my_pools_bloc.dart';

@freezed
sealed class MyPoolsEvent with _$MyPoolsEvent {
  const factory MyPoolsEvent.fetchRequested() = MyPoolsFetchRequested;
}
