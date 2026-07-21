// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_pools_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPoolsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPoolsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyPoolsEvent()';
}


}

/// @nodoc
class $MyPoolsEventCopyWith<$Res>  {
$MyPoolsEventCopyWith(MyPoolsEvent _, $Res Function(MyPoolsEvent) __);
}


/// Adds pattern-matching-related methods to [MyPoolsEvent].
extension MyPoolsEventPatterns on MyPoolsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyPoolsFetchRequested value)?  fetchRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyPoolsFetchRequested() when fetchRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyPoolsFetchRequested value)  fetchRequested,}){
final _that = this;
switch (_that) {
case MyPoolsFetchRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyPoolsFetchRequested value)?  fetchRequested,}){
final _that = this;
switch (_that) {
case MyPoolsFetchRequested() when fetchRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyPoolsFetchRequested() when fetchRequested != null:
return fetchRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchRequested,}) {final _that = this;
switch (_that) {
case MyPoolsFetchRequested():
return fetchRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchRequested,}) {final _that = this;
switch (_that) {
case MyPoolsFetchRequested() when fetchRequested != null:
return fetchRequested();case _:
  return null;

}
}

}

/// @nodoc


class MyPoolsFetchRequested implements MyPoolsEvent {
  const MyPoolsFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPoolsFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyPoolsEvent.fetchRequested()';
}


}




/// @nodoc
mixin _$MyPoolsState {

 MyPoolsRequestStatus get status; List<Pool> get pools; String? get error;
/// Create a copy of MyPoolsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPoolsStateCopyWith<MyPoolsState> get copyWith => _$MyPoolsStateCopyWithImpl<MyPoolsState>(this as MyPoolsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPoolsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pools, pools)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(pools),error);

@override
String toString() {
  return 'MyPoolsState(status: $status, pools: $pools, error: $error)';
}


}

/// @nodoc
abstract mixin class $MyPoolsStateCopyWith<$Res>  {
  factory $MyPoolsStateCopyWith(MyPoolsState value, $Res Function(MyPoolsState) _then) = _$MyPoolsStateCopyWithImpl;
@useResult
$Res call({
 MyPoolsRequestStatus status, List<Pool> pools, String? error
});




}
/// @nodoc
class _$MyPoolsStateCopyWithImpl<$Res>
    implements $MyPoolsStateCopyWith<$Res> {
  _$MyPoolsStateCopyWithImpl(this._self, this._then);

  final MyPoolsState _self;
  final $Res Function(MyPoolsState) _then;

/// Create a copy of MyPoolsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pools = null,Object? error = freezed,}) {
  return _then(MyPoolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyPoolsRequestStatus,pools: null == pools ? _self.pools : pools // ignore: cast_nullable_to_non_nullable
as List<Pool>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyPoolsState].
extension MyPoolsStatePatterns on MyPoolsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPoolsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPoolsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPoolsState value)  $default,){
final _that = this;
switch (_that) {
case _MyPoolsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPoolsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPoolsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyPoolsRequestStatus status,  List<Pool> pools,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPoolsState() when $default != null:
return $default(_that.status,_that.pools,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyPoolsRequestStatus status,  List<Pool> pools,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MyPoolsState():
return $default(_that.status,_that.pools,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyPoolsRequestStatus status,  List<Pool> pools,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MyPoolsState() when $default != null:
return $default(_that.status,_that.pools,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MyPoolsState implements MyPoolsState {
  const _MyPoolsState({this.status = MyPoolsRequestStatus.initial,  List<Pool> pools = const <Pool>[], this.error}): _pools = pools;
  

@override@JsonKey() final  MyPoolsRequestStatus status;
 final  List<Pool> _pools;
@override@JsonKey() List<Pool> get pools {
  if (_pools is EqualUnmodifiableListView) return _pools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pools);
}

@override final  String? error;

/// Create a copy of MyPoolsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPoolsStateCopyWith<_MyPoolsState> get copyWith => __$MyPoolsStateCopyWithImpl<_MyPoolsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPoolsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pools, _pools)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_pools),error);

@override
String toString() {
  return 'MyPoolsState(status: $status, pools: $pools, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MyPoolsStateCopyWith<$Res> implements $MyPoolsStateCopyWith<$Res> {
  factory _$MyPoolsStateCopyWith(_MyPoolsState value, $Res Function(_MyPoolsState) _then) = __$MyPoolsStateCopyWithImpl;
@override @useResult
$Res call({
 MyPoolsRequestStatus status, List<Pool> pools, String? error
});




}
/// @nodoc
class __$MyPoolsStateCopyWithImpl<$Res>
    implements _$MyPoolsStateCopyWith<$Res> {
  __$MyPoolsStateCopyWithImpl(this._self, this._then);

  final _MyPoolsState _self;
  final $Res Function(_MyPoolsState) _then;

/// Create a copy of MyPoolsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pools = null,Object? error = freezed,}) {
  return _then(_MyPoolsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyPoolsRequestStatus,pools: null == pools ? _self._pools : pools // ignore: cast_nullable_to_non_nullable
as List<Pool>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
