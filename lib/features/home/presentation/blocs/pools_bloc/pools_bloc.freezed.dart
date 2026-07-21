// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pools_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PoolsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PoolsEvent()';
}


}

/// @nodoc
class $PoolsEventCopyWith<$Res>  {
$PoolsEventCopyWith(PoolsEvent _, $Res Function(PoolsEvent) __);
}


/// Adds pattern-matching-related methods to [PoolsEvent].
extension PoolsEventPatterns on PoolsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PoolsFetchRequested value)?  fetchRequested,TResult Function( PoolsFilterChanged value)?  filterChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PoolsFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case PoolsFilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PoolsFetchRequested value)  fetchRequested,required TResult Function( PoolsFilterChanged value)  filterChanged,}){
final _that = this;
switch (_that) {
case PoolsFetchRequested():
return fetchRequested(_that);case PoolsFilterChanged():
return filterChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PoolsFetchRequested value)?  fetchRequested,TResult? Function( PoolsFilterChanged value)?  filterChanged,}){
final _that = this;
switch (_that) {
case PoolsFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case PoolsFilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,TResult Function( PoolFilter filter)?  filterChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PoolsFetchRequested() when fetchRequested != null:
return fetchRequested();case PoolsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,required TResult Function( PoolFilter filter)  filterChanged,}) {final _that = this;
switch (_that) {
case PoolsFetchRequested():
return fetchRequested();case PoolsFilterChanged():
return filterChanged(_that.filter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,TResult? Function( PoolFilter filter)?  filterChanged,}) {final _that = this;
switch (_that) {
case PoolsFetchRequested() when fetchRequested != null:
return fetchRequested();case PoolsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class PoolsFetchRequested implements PoolsEvent {
  const PoolsFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolsFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PoolsEvent.fetchRequested()';
}


}




/// @nodoc


class PoolsFilterChanged implements PoolsEvent {
  const PoolsFilterChanged(this.filter);
  

 final  PoolFilter filter;

/// Create a copy of PoolsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolsFilterChangedCopyWith<PoolsFilterChanged> get copyWith => _$PoolsFilterChangedCopyWithImpl<PoolsFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolsFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'PoolsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $PoolsFilterChangedCopyWith<$Res> implements $PoolsEventCopyWith<$Res> {
  factory $PoolsFilterChangedCopyWith(PoolsFilterChanged value, $Res Function(PoolsFilterChanged) _then) = _$PoolsFilterChangedCopyWithImpl;
@useResult
$Res call({
 PoolFilter filter
});




}
/// @nodoc
class _$PoolsFilterChangedCopyWithImpl<$Res>
    implements $PoolsFilterChangedCopyWith<$Res> {
  _$PoolsFilterChangedCopyWithImpl(this._self, this._then);

  final PoolsFilterChanged _self;
  final $Res Function(PoolsFilterChanged) _then;

/// Create a copy of PoolsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(PoolsFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PoolFilter,
  ));
}


}

/// @nodoc
mixin _$PoolsState {

 PoolsRequestStatus get status; List<Pool> get pools; String? get error; PoolFilter get filter;
/// Create a copy of PoolsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoolsStateCopyWith<PoolsState> get copyWith => _$PoolsStateCopyWithImpl<PoolsState>(this as PoolsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoolsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pools, pools)&&(identical(other.error, error) || other.error == error)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(pools),error,filter);

@override
String toString() {
  return 'PoolsState(status: $status, pools: $pools, error: $error, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $PoolsStateCopyWith<$Res>  {
  factory $PoolsStateCopyWith(PoolsState value, $Res Function(PoolsState) _then) = _$PoolsStateCopyWithImpl;
@useResult
$Res call({
 PoolsRequestStatus status, List<Pool> pools, String? error, PoolFilter filter
});




}
/// @nodoc
class _$PoolsStateCopyWithImpl<$Res>
    implements $PoolsStateCopyWith<$Res> {
  _$PoolsStateCopyWithImpl(this._self, this._then);

  final PoolsState _self;
  final $Res Function(PoolsState) _then;

/// Create a copy of PoolsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pools = null,Object? error = freezed,Object? filter = null,}) {
  return _then(PoolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolsRequestStatus,pools: null == pools ? _self.pools : pools // ignore: cast_nullable_to_non_nullable
as List<Pool>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PoolFilter,
  ));
}

}


/// Adds pattern-matching-related methods to [PoolsState].
extension PoolsStatePatterns on PoolsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoolsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoolsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoolsState value)  $default,){
final _that = this;
switch (_that) {
case _PoolsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoolsState value)?  $default,){
final _that = this;
switch (_that) {
case _PoolsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PoolsRequestStatus status,  List<Pool> pools,  String? error,  PoolFilter filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoolsState() when $default != null:
return $default(_that.status,_that.pools,_that.error,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PoolsRequestStatus status,  List<Pool> pools,  String? error,  PoolFilter filter)  $default,) {final _that = this;
switch (_that) {
case _PoolsState():
return $default(_that.status,_that.pools,_that.error,_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PoolsRequestStatus status,  List<Pool> pools,  String? error,  PoolFilter filter)?  $default,) {final _that = this;
switch (_that) {
case _PoolsState() when $default != null:
return $default(_that.status,_that.pools,_that.error,_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _PoolsState implements PoolsState {
  const _PoolsState({this.status = PoolsRequestStatus.initial,  List<Pool> pools = const <Pool>[], this.error, this.filter = PoolFilter.all}): _pools = pools;
  

@override@JsonKey() final  PoolsRequestStatus status;
 final  List<Pool> _pools;
@override@JsonKey() List<Pool> get pools {
  if (_pools is EqualUnmodifiableListView) return _pools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pools);
}

@override final  String? error;
@override@JsonKey() final  PoolFilter filter;

/// Create a copy of PoolsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoolsStateCopyWith<_PoolsState> get copyWith => __$PoolsStateCopyWithImpl<_PoolsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoolsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pools, _pools)&&(identical(other.error, error) || other.error == error)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_pools),error,filter);

@override
String toString() {
  return 'PoolsState(status: $status, pools: $pools, error: $error, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$PoolsStateCopyWith<$Res> implements $PoolsStateCopyWith<$Res> {
  factory _$PoolsStateCopyWith(_PoolsState value, $Res Function(_PoolsState) _then) = __$PoolsStateCopyWithImpl;
@override @useResult
$Res call({
 PoolsRequestStatus status, List<Pool> pools, String? error, PoolFilter filter
});




}
/// @nodoc
class __$PoolsStateCopyWithImpl<$Res>
    implements _$PoolsStateCopyWith<$Res> {
  __$PoolsStateCopyWithImpl(this._self, this._then);

  final _PoolsState _self;
  final $Res Function(_PoolsState) _then;

/// Create a copy of PoolsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pools = null,Object? error = freezed,Object? filter = null,}) {
  return _then(_PoolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PoolsRequestStatus,pools: null == pools ? _self._pools : pools // ignore: cast_nullable_to_non_nullable
as List<Pool>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as PoolFilter,
  ));
}


}

// dart format on
