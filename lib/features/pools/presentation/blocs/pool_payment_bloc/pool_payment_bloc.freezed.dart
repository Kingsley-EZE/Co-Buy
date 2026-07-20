// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pool_payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PoolPaymentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolPaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PoolPaymentEvent()';
}


}

/// @nodoc
class $PoolPaymentEventCopyWith<$Res>  {
$PoolPaymentEventCopyWith(PoolPaymentEvent _, $Res Function(PoolPaymentEvent) __);
}


/// Adds pattern-matching-related methods to [PoolPaymentEvent].
extension PoolPaymentEventPatterns on PoolPaymentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PoolPaymentPayRequested value)?  payRequested,TResult Function( PoolPaymentStateCleared value)?  stateCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PoolPaymentPayRequested() when payRequested != null:
return payRequested(_that);case PoolPaymentStateCleared() when stateCleared != null:
return stateCleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PoolPaymentPayRequested value)  payRequested,required TResult Function( PoolPaymentStateCleared value)  stateCleared,}){
final _that = this;
switch (_that) {
case PoolPaymentPayRequested():
return payRequested(_that);case PoolPaymentStateCleared():
return stateCleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PoolPaymentPayRequested value)?  payRequested,TResult? Function( PoolPaymentStateCleared value)?  stateCleared,}){
final _that = this;
switch (_that) {
case PoolPaymentPayRequested() when payRequested != null:
return payRequested(_that);case PoolPaymentStateCleared() when stateCleared != null:
return stateCleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PoolPaymentRequest request)?  payRequested,TResult Function()?  stateCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PoolPaymentPayRequested() when payRequested != null:
return payRequested(_that.request);case PoolPaymentStateCleared() when stateCleared != null:
return stateCleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PoolPaymentRequest request)  payRequested,required TResult Function()  stateCleared,}) {final _that = this;
switch (_that) {
case PoolPaymentPayRequested():
return payRequested(_that.request);case PoolPaymentStateCleared():
return stateCleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PoolPaymentRequest request)?  payRequested,TResult? Function()?  stateCleared,}) {final _that = this;
switch (_that) {
case PoolPaymentPayRequested() when payRequested != null:
return payRequested(_that.request);case PoolPaymentStateCleared() when stateCleared != null:
return stateCleared();case _:
  return null;

}
}

}

/// @nodoc


class PoolPaymentPayRequested implements PoolPaymentEvent {
  const PoolPaymentPayRequested(this.request);
  

 final  PoolPaymentRequest request;

/// Create a copy of PoolPaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolPaymentPayRequestedCopyWith<PoolPaymentPayRequested> get copyWith => _$PoolPaymentPayRequestedCopyWithImpl<PoolPaymentPayRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolPaymentPayRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'PoolPaymentEvent.payRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class $PoolPaymentPayRequestedCopyWith<$Res> implements $PoolPaymentEventCopyWith<$Res> {
  factory $PoolPaymentPayRequestedCopyWith(PoolPaymentPayRequested value, $Res Function(PoolPaymentPayRequested) _then) = _$PoolPaymentPayRequestedCopyWithImpl;
@useResult
$Res call({
 PoolPaymentRequest request
});




}
/// @nodoc
class _$PoolPaymentPayRequestedCopyWithImpl<$Res>
    implements $PoolPaymentPayRequestedCopyWith<$Res> {
  _$PoolPaymentPayRequestedCopyWithImpl(this._self, this._then);

  final PoolPaymentPayRequested _self;
  final $Res Function(PoolPaymentPayRequested) _then;

/// Create a copy of PoolPaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(PoolPaymentPayRequested(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PoolPaymentRequest,
  ));
}


}

/// @nodoc


class PoolPaymentStateCleared implements PoolPaymentEvent {
  const PoolPaymentStateCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolPaymentStateCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PoolPaymentEvent.stateCleared()';
}


}




/// @nodoc
mixin _$PoolPaymentState {

 PoolPaymentRequestStatus get status;/// The initiated payment — set exactly while [status] is success.
 PoolPayment? get payment; String? get error;
/// Create a copy of PoolPaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolPaymentStateCopyWith<PoolPaymentState> get copyWith => _$PoolPaymentStateCopyWithImpl<PoolPaymentState>(this as PoolPaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolPaymentState&&(identical(other.status, status) || other.status == status)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,payment,error);

@override
String toString() {
  return 'PoolPaymentState(status: $status, payment: $payment, error: $error)';
}


}

/// @nodoc
abstract mixin class $PoolPaymentStateCopyWith<$Res>  {
  factory $PoolPaymentStateCopyWith(PoolPaymentState value, $Res Function(PoolPaymentState) _then) = _$PoolPaymentStateCopyWithImpl;
@useResult
$Res call({
 PoolPaymentRequestStatus status, PoolPayment? payment, String? error
});




}
/// @nodoc
class _$PoolPaymentStateCopyWithImpl<$Res>
    implements $PoolPaymentStateCopyWith<$Res> {
  _$PoolPaymentStateCopyWithImpl(this._self, this._then);

  final PoolPaymentState _self;
  final $Res Function(PoolPaymentState) _then;

/// Create a copy of PoolPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? payment = freezed,Object? error = freezed,}) {
  return _then(PoolPaymentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolPaymentRequestStatus,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PoolPayment?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolPaymentState].
extension PoolPaymentStatePatterns on PoolPaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoolPaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoolPaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoolPaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PoolPaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoolPaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PoolPaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PoolPaymentRequestStatus status,  PoolPayment? payment,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoolPaymentState() when $default != null:
return $default(_that.status,_that.payment,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PoolPaymentRequestStatus status,  PoolPayment? payment,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PoolPaymentState():
return $default(_that.status,_that.payment,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PoolPaymentRequestStatus status,  PoolPayment? payment,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PoolPaymentState() when $default != null:
return $default(_that.status,_that.payment,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PoolPaymentState implements PoolPaymentState {
  const _PoolPaymentState({this.status = PoolPaymentRequestStatus.initial, this.payment, this.error});
  

@override@JsonKey() final  PoolPaymentRequestStatus status;
/// The initiated payment — set exactly while [status] is success.
@override final  PoolPayment? payment;
@override final  String? error;

/// Create a copy of PoolPaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoolPaymentStateCopyWith<_PoolPaymentState> get copyWith => __$PoolPaymentStateCopyWithImpl<_PoolPaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoolPaymentState&&(identical(other.status, status) || other.status == status)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,payment,error);

@override
String toString() {
  return 'PoolPaymentState(status: $status, payment: $payment, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PoolPaymentStateCopyWith<$Res> implements $PoolPaymentStateCopyWith<$Res> {
  factory _$PoolPaymentStateCopyWith(_PoolPaymentState value, $Res Function(_PoolPaymentState) _then) = __$PoolPaymentStateCopyWithImpl;
@override @useResult
$Res call({
 PoolPaymentRequestStatus status, PoolPayment? payment, String? error
});




}
/// @nodoc
class __$PoolPaymentStateCopyWithImpl<$Res>
    implements _$PoolPaymentStateCopyWith<$Res> {
  __$PoolPaymentStateCopyWithImpl(this._self, this._then);

  final _PoolPaymentState _self;
  final $Res Function(_PoolPaymentState) _then;

/// Create a copy of PoolPaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? payment = freezed,Object? error = freezed,}) {
  return _then(_PoolPaymentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolPaymentRequestStatus,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PoolPayment?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
