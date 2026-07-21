// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pool_transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PoolTransactionsEvent {

 String get poolId;
/// Create a copy of PoolTransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolTransactionsEventCopyWith<PoolTransactionsEvent> get copyWith => _$PoolTransactionsEventCopyWithImpl<PoolTransactionsEvent>(this as PoolTransactionsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolTransactionsEvent&&(identical(other.poolId, poolId) || other.poolId == poolId));
}


@override
int get hashCode => Object.hash(runtimeType,poolId);

@override
String toString() {
  return 'PoolTransactionsEvent(poolId: $poolId)';
}


}

/// @nodoc
abstract mixin class $PoolTransactionsEventCopyWith<$Res>  {
  factory $PoolTransactionsEventCopyWith(PoolTransactionsEvent value, $Res Function(PoolTransactionsEvent) _then) = _$PoolTransactionsEventCopyWithImpl;
@useResult
$Res call({
 String poolId
});




}
/// @nodoc
class _$PoolTransactionsEventCopyWithImpl<$Res>
    implements $PoolTransactionsEventCopyWith<$Res> {
  _$PoolTransactionsEventCopyWithImpl(this._self, this._then);

  final PoolTransactionsEvent _self;
  final $Res Function(PoolTransactionsEvent) _then;

/// Create a copy of PoolTransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? poolId = null,}) {
  return _then(PoolTransactionsEvent.fetchRequested(
null == poolId ? _self.poolId : poolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolTransactionsEvent].
extension PoolTransactionsEventPatterns on PoolTransactionsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PoolTransactionsFetchRequested value)?  fetchRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PoolTransactionsFetchRequested value)  fetchRequested,}){
final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested():
return fetchRequested(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PoolTransactionsFetchRequested value)?  fetchRequested,}){
final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String poolId)?  fetchRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested() when fetchRequested != null:
return fetchRequested(_that.poolId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String poolId)  fetchRequested,}) {final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested():
return fetchRequested(_that.poolId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String poolId)?  fetchRequested,}) {final _that = this;
switch (_that) {
case PoolTransactionsFetchRequested() when fetchRequested != null:
return fetchRequested(_that.poolId);case _:
  return null;

}
}

}

/// @nodoc


class PoolTransactionsFetchRequested implements PoolTransactionsEvent {
  const PoolTransactionsFetchRequested(this.poolId);
  

@override final  String poolId;

/// Create a copy of PoolTransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolTransactionsFetchRequestedCopyWith<PoolTransactionsFetchRequested> get copyWith => _$PoolTransactionsFetchRequestedCopyWithImpl<PoolTransactionsFetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolTransactionsFetchRequested&&(identical(other.poolId, poolId) || other.poolId == poolId));
}


@override
int get hashCode => Object.hash(runtimeType,poolId);

@override
String toString() {
  return 'PoolTransactionsEvent.fetchRequested(poolId: $poolId)';
}


}

/// @nodoc
abstract mixin class $PoolTransactionsFetchRequestedCopyWith<$Res> implements $PoolTransactionsEventCopyWith<$Res> {
  factory $PoolTransactionsFetchRequestedCopyWith(PoolTransactionsFetchRequested value, $Res Function(PoolTransactionsFetchRequested) _then) = _$PoolTransactionsFetchRequestedCopyWithImpl;
@override @useResult
$Res call({
 String poolId
});




}
/// @nodoc
class _$PoolTransactionsFetchRequestedCopyWithImpl<$Res>
    implements $PoolTransactionsFetchRequestedCopyWith<$Res> {
  _$PoolTransactionsFetchRequestedCopyWithImpl(this._self, this._then);

  final PoolTransactionsFetchRequested _self;
  final $Res Function(PoolTransactionsFetchRequested) _then;

/// Create a copy of PoolTransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? poolId = null,}) {
  return _then(PoolTransactionsFetchRequested(
null == poolId ? _self.poolId : poolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PoolTransactionsState {

 PoolTransactionsRequestStatus get status; List<PoolTransaction> get transactions; String? get error;
/// Create a copy of PoolTransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolTransactionsStateCopyWith<PoolTransactionsState> get copyWith => _$PoolTransactionsStateCopyWithImpl<PoolTransactionsState>(this as PoolTransactionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolTransactionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(transactions),error);

@override
String toString() {
  return 'PoolTransactionsState(status: $status, transactions: $transactions, error: $error)';
}


}

/// @nodoc
abstract mixin class $PoolTransactionsStateCopyWith<$Res>  {
  factory $PoolTransactionsStateCopyWith(PoolTransactionsState value, $Res Function(PoolTransactionsState) _then) = _$PoolTransactionsStateCopyWithImpl;
@useResult
$Res call({
 PoolTransactionsRequestStatus status, List<PoolTransaction> transactions, String? error
});




}
/// @nodoc
class _$PoolTransactionsStateCopyWithImpl<$Res>
    implements $PoolTransactionsStateCopyWith<$Res> {
  _$PoolTransactionsStateCopyWithImpl(this._self, this._then);

  final PoolTransactionsState _self;
  final $Res Function(PoolTransactionsState) _then;

/// Create a copy of PoolTransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? transactions = null,Object? error = freezed,}) {
  return _then(PoolTransactionsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolTransactionsRequestStatus,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<PoolTransaction>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolTransactionsState].
extension PoolTransactionsStatePatterns on PoolTransactionsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoolTransactionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoolTransactionsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoolTransactionsState value)  $default,){
final _that = this;
switch (_that) {
case _PoolTransactionsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoolTransactionsState value)?  $default,){
final _that = this;
switch (_that) {
case _PoolTransactionsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PoolTransactionsRequestStatus status,  List<PoolTransaction> transactions,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoolTransactionsState() when $default != null:
return $default(_that.status,_that.transactions,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PoolTransactionsRequestStatus status,  List<PoolTransaction> transactions,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PoolTransactionsState():
return $default(_that.status,_that.transactions,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PoolTransactionsRequestStatus status,  List<PoolTransaction> transactions,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PoolTransactionsState() when $default != null:
return $default(_that.status,_that.transactions,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PoolTransactionsState implements PoolTransactionsState {
  const _PoolTransactionsState({this.status = PoolTransactionsRequestStatus.initial,  List<PoolTransaction> transactions = const <PoolTransaction>[], this.error}): _transactions = transactions;
  

@override@JsonKey() final  PoolTransactionsRequestStatus status;
 final  List<PoolTransaction> _transactions;
@override@JsonKey() List<PoolTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  String? error;

/// Create a copy of PoolTransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoolTransactionsStateCopyWith<_PoolTransactionsState> get copyWith => __$PoolTransactionsStateCopyWithImpl<_PoolTransactionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoolTransactionsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_transactions),error);

@override
String toString() {
  return 'PoolTransactionsState(status: $status, transactions: $transactions, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PoolTransactionsStateCopyWith<$Res> implements $PoolTransactionsStateCopyWith<$Res> {
  factory _$PoolTransactionsStateCopyWith(_PoolTransactionsState value, $Res Function(_PoolTransactionsState) _then) = __$PoolTransactionsStateCopyWithImpl;
@override @useResult
$Res call({
 PoolTransactionsRequestStatus status, List<PoolTransaction> transactions, String? error
});




}
/// @nodoc
class __$PoolTransactionsStateCopyWithImpl<$Res>
    implements _$PoolTransactionsStateCopyWith<$Res> {
  __$PoolTransactionsStateCopyWithImpl(this._self, this._then);

  final _PoolTransactionsState _self;
  final $Res Function(_PoolTransactionsState) _then;

/// Create a copy of PoolTransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? transactions = null,Object? error = freezed,}) {
  return _then(_PoolTransactionsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolTransactionsRequestStatus,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<PoolTransaction>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
