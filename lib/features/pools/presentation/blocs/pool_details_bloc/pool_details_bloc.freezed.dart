// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pool_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PoolDetailsEvent {

 String get poolId;
/// Create a copy of PoolDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolDetailsEventCopyWith<PoolDetailsEvent> get copyWith => _$PoolDetailsEventCopyWithImpl<PoolDetailsEvent>(this as PoolDetailsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolDetailsEvent&&(identical(other.poolId, poolId) || other.poolId == poolId));
}


@override
int get hashCode => Object.hash(runtimeType,poolId);

@override
String toString() {
  return 'PoolDetailsEvent(poolId: $poolId)';
}


}

/// @nodoc
abstract mixin class $PoolDetailsEventCopyWith<$Res>  {
  factory $PoolDetailsEventCopyWith(PoolDetailsEvent value, $Res Function(PoolDetailsEvent) _then) = _$PoolDetailsEventCopyWithImpl;
@useResult
$Res call({
 String poolId
});




}
/// @nodoc
class _$PoolDetailsEventCopyWithImpl<$Res>
    implements $PoolDetailsEventCopyWith<$Res> {
  _$PoolDetailsEventCopyWithImpl(this._self, this._then);

  final PoolDetailsEvent _self;
  final $Res Function(PoolDetailsEvent) _then;

/// Create a copy of PoolDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? poolId = null,}) {
  return _then(PoolDetailsEvent.fetchRequested(
null == poolId ? _self.poolId : poolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolDetailsEvent].
extension PoolDetailsEventPatterns on PoolDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PoolDetailsFetchRequested value)?  fetchRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PoolDetailsFetchRequested() when fetchRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PoolDetailsFetchRequested value)  fetchRequested,}){
final _that = this;
switch (_that) {
case PoolDetailsFetchRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PoolDetailsFetchRequested value)?  fetchRequested,}){
final _that = this;
switch (_that) {
case PoolDetailsFetchRequested() when fetchRequested != null:
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
case PoolDetailsFetchRequested() when fetchRequested != null:
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
case PoolDetailsFetchRequested():
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
case PoolDetailsFetchRequested() when fetchRequested != null:
return fetchRequested(_that.poolId);case _:
  return null;

}
}

}

/// @nodoc


class PoolDetailsFetchRequested implements PoolDetailsEvent {
  const PoolDetailsFetchRequested(this.poolId);
  

@override final  String poolId;

/// Create a copy of PoolDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolDetailsFetchRequestedCopyWith<PoolDetailsFetchRequested> get copyWith => _$PoolDetailsFetchRequestedCopyWithImpl<PoolDetailsFetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolDetailsFetchRequested&&(identical(other.poolId, poolId) || other.poolId == poolId));
}


@override
int get hashCode => Object.hash(runtimeType,poolId);

@override
String toString() {
  return 'PoolDetailsEvent.fetchRequested(poolId: $poolId)';
}


}

/// @nodoc
abstract mixin class $PoolDetailsFetchRequestedCopyWith<$Res> implements $PoolDetailsEventCopyWith<$Res> {
  factory $PoolDetailsFetchRequestedCopyWith(PoolDetailsFetchRequested value, $Res Function(PoolDetailsFetchRequested) _then) = _$PoolDetailsFetchRequestedCopyWithImpl;
@override @useResult
$Res call({
 String poolId
});




}
/// @nodoc
class _$PoolDetailsFetchRequestedCopyWithImpl<$Res>
    implements $PoolDetailsFetchRequestedCopyWith<$Res> {
  _$PoolDetailsFetchRequestedCopyWithImpl(this._self, this._then);

  final PoolDetailsFetchRequested _self;
  final $Res Function(PoolDetailsFetchRequested) _then;

/// Create a copy of PoolDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? poolId = null,}) {
  return _then(PoolDetailsFetchRequested(
null == poolId ? _self.poolId : poolId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PoolDetailsState {

 PoolDetailsRequestStatus get detailsStatus; PoolDetails? get details; String? get detailsError; PoolDetailsRequestStatus get membersStatus; List<PoolMember> get members; String? get membersError;
/// Create a copy of PoolDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolDetailsStateCopyWith<PoolDetailsState> get copyWith => _$PoolDetailsStateCopyWithImpl<PoolDetailsState>(this as PoolDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolDetailsState&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.membersStatus, membersStatus) || other.membersStatus == membersStatus)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.membersError, membersError) || other.membersError == membersError));
}


@override
int get hashCode => Object.hash(runtimeType,detailsStatus,details,detailsError,membersStatus,const DeepCollectionEquality().hash(members),membersError);

@override
String toString() {
  return 'PoolDetailsState(detailsStatus: $detailsStatus, details: $details, detailsError: $detailsError, membersStatus: $membersStatus, members: $members, membersError: $membersError)';
}


}

/// @nodoc
abstract mixin class $PoolDetailsStateCopyWith<$Res>  {
  factory $PoolDetailsStateCopyWith(PoolDetailsState value, $Res Function(PoolDetailsState) _then) = _$PoolDetailsStateCopyWithImpl;
@useResult
$Res call({
 PoolDetailsRequestStatus detailsStatus, PoolDetails? details, String? detailsError, PoolDetailsRequestStatus membersStatus, List<PoolMember> members, String? membersError
});




}
/// @nodoc
class _$PoolDetailsStateCopyWithImpl<$Res>
    implements $PoolDetailsStateCopyWith<$Res> {
  _$PoolDetailsStateCopyWithImpl(this._self, this._then);

  final PoolDetailsState _self;
  final $Res Function(PoolDetailsState) _then;

/// Create a copy of PoolDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detailsStatus = null,Object? details = freezed,Object? detailsError = freezed,Object? membersStatus = null,Object? members = null,Object? membersError = freezed,}) {
  return _then(PoolDetailsState(
detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as PoolDetailsRequestStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as PoolDetails?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,membersStatus: null == membersStatus ? _self.membersStatus : membersStatus // ignore: cast_nullable_to_non_nullable
as PoolDetailsRequestStatus,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<PoolMember>,membersError: freezed == membersError ? _self.membersError : membersError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolDetailsState].
extension PoolDetailsStatePatterns on PoolDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoolDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoolDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoolDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PoolDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoolDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PoolDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PoolDetailsRequestStatus detailsStatus,  PoolDetails? details,  String? detailsError,  PoolDetailsRequestStatus membersStatus,  List<PoolMember> members,  String? membersError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoolDetailsState() when $default != null:
return $default(_that.detailsStatus,_that.details,_that.detailsError,_that.membersStatus,_that.members,_that.membersError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PoolDetailsRequestStatus detailsStatus,  PoolDetails? details,  String? detailsError,  PoolDetailsRequestStatus membersStatus,  List<PoolMember> members,  String? membersError)  $default,) {final _that = this;
switch (_that) {
case _PoolDetailsState():
return $default(_that.detailsStatus,_that.details,_that.detailsError,_that.membersStatus,_that.members,_that.membersError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PoolDetailsRequestStatus detailsStatus,  PoolDetails? details,  String? detailsError,  PoolDetailsRequestStatus membersStatus,  List<PoolMember> members,  String? membersError)?  $default,) {final _that = this;
switch (_that) {
case _PoolDetailsState() when $default != null:
return $default(_that.detailsStatus,_that.details,_that.detailsError,_that.membersStatus,_that.members,_that.membersError);case _:
  return null;

}
}

}

/// @nodoc


class _PoolDetailsState extends PoolDetailsState {
  const _PoolDetailsState({this.detailsStatus = PoolDetailsRequestStatus.initial, this.details, this.detailsError, this.membersStatus = PoolDetailsRequestStatus.initial,  List<PoolMember> members = const <PoolMember>[], this.membersError}): _members = members,super._();
  

@override@JsonKey() final  PoolDetailsRequestStatus detailsStatus;
@override final  PoolDetails? details;
@override final  String? detailsError;
@override@JsonKey() final  PoolDetailsRequestStatus membersStatus;
 final  List<PoolMember> _members;
@override@JsonKey() List<PoolMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override final  String? membersError;

/// Create a copy of PoolDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoolDetailsStateCopyWith<_PoolDetailsState> get copyWith => __$PoolDetailsStateCopyWithImpl<_PoolDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoolDetailsState&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.membersStatus, membersStatus) || other.membersStatus == membersStatus)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.membersError, membersError) || other.membersError == membersError));
}


@override
int get hashCode => Object.hash(runtimeType,detailsStatus,details,detailsError,membersStatus,const DeepCollectionEquality().hash(_members),membersError);

@override
String toString() {
  return 'PoolDetailsState(detailsStatus: $detailsStatus, details: $details, detailsError: $detailsError, membersStatus: $membersStatus, members: $members, membersError: $membersError)';
}


}

/// @nodoc
abstract mixin class _$PoolDetailsStateCopyWith<$Res> implements $PoolDetailsStateCopyWith<$Res> {
  factory _$PoolDetailsStateCopyWith(_PoolDetailsState value, $Res Function(_PoolDetailsState) _then) = __$PoolDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 PoolDetailsRequestStatus detailsStatus, PoolDetails? details, String? detailsError, PoolDetailsRequestStatus membersStatus, List<PoolMember> members, String? membersError
});




}
/// @nodoc
class __$PoolDetailsStateCopyWithImpl<$Res>
    implements _$PoolDetailsStateCopyWith<$Res> {
  __$PoolDetailsStateCopyWithImpl(this._self, this._then);

  final _PoolDetailsState _self;
  final $Res Function(_PoolDetailsState) _then;

/// Create a copy of PoolDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detailsStatus = null,Object? details = freezed,Object? detailsError = freezed,Object? membersStatus = null,Object? members = null,Object? membersError = freezed,}) {
  return _then(_PoolDetailsState(
detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as PoolDetailsRequestStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as PoolDetails?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,membersStatus: null == membersStatus ? _self.membersStatus : membersStatus // ignore: cast_nullable_to_non_nullable
as PoolDetailsRequestStatus,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<PoolMember>,membersError: freezed == membersError ? _self.membersError : membersError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
