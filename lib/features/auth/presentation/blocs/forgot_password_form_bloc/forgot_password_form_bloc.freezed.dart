// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordFormEvent {

 String get email;
/// Create a copy of ForgotPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordFormEventCopyWith<ForgotPasswordFormEvent> get copyWith => _$ForgotPasswordFormEventCopyWithImpl<ForgotPasswordFormEvent>(this as ForgotPasswordFormEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordFormEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordFormEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordFormEventCopyWith<$Res>  {
  factory $ForgotPasswordFormEventCopyWith(ForgotPasswordFormEvent value, $Res Function(ForgotPasswordFormEvent) _then) = _$ForgotPasswordFormEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordFormEventCopyWithImpl<$Res>
    implements $ForgotPasswordFormEventCopyWith<$Res> {
  _$ForgotPasswordFormEventCopyWithImpl(this._self, this._then);

  final ForgotPasswordFormEvent _self;
  final $Res Function(ForgotPasswordFormEvent) _then;

/// Create a copy of ForgotPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(ForgotPasswordFormEvent.emailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordFormEvent].
extension ForgotPasswordFormEventPatterns on ForgotPasswordFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordEmailChanged value)?  emailChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged() when emailChanged != null:
return emailChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordEmailChanged value)  emailChanged,}){
final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged():
return emailChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordEmailChanged value)?  emailChanged,}){
final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged() when emailChanged != null:
return emailChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  emailChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  emailChanged,}) {final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged():
return emailChanged(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  emailChanged,}) {final _that = this;
switch (_that) {
case ForgotPasswordEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordEmailChanged implements ForgotPasswordFormEvent {
  const ForgotPasswordEmailChanged(this.email);
  

@override final  String email;

/// Create a copy of ForgotPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordEmailChangedCopyWith<ForgotPasswordEmailChanged> get copyWith => _$ForgotPasswordEmailChangedCopyWithImpl<ForgotPasswordEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordFormEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordEmailChangedCopyWith<$Res> implements $ForgotPasswordFormEventCopyWith<$Res> {
  factory $ForgotPasswordEmailChangedCopyWith(ForgotPasswordEmailChanged value, $Res Function(ForgotPasswordEmailChanged) _then) = _$ForgotPasswordEmailChangedCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordEmailChangedCopyWithImpl<$Res>
    implements $ForgotPasswordEmailChangedCopyWith<$Res> {
  _$ForgotPasswordEmailChangedCopyWithImpl(this._self, this._then);

  final ForgotPasswordEmailChanged _self;
  final $Res Function(ForgotPasswordEmailChanged) _then;

/// Create a copy of ForgotPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ForgotPasswordFormState {

 String get email;
/// Create a copy of ForgotPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordFormStateCopyWith<ForgotPasswordFormState> get copyWith => _$ForgotPasswordFormStateCopyWithImpl<ForgotPasswordFormState>(this as ForgotPasswordFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordFormState&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordFormState(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordFormStateCopyWith<$Res>  {
  factory $ForgotPasswordFormStateCopyWith(ForgotPasswordFormState value, $Res Function(ForgotPasswordFormState) _then) = _$ForgotPasswordFormStateCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordFormStateCopyWithImpl<$Res>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  _$ForgotPasswordFormStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordFormState _self;
  final $Res Function(ForgotPasswordFormState) _then;

/// Create a copy of ForgotPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(ForgotPasswordFormState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordFormState].
extension ForgotPasswordFormStatePatterns on ForgotPasswordFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordFormState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordFormState() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordFormState():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordFormState() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordFormState extends ForgotPasswordFormState {
  const _ForgotPasswordFormState({this.email = ''}): super._();
  

@override@JsonKey() final  String email;

/// Create a copy of ForgotPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordFormStateCopyWith<_ForgotPasswordFormState> get copyWith => __$ForgotPasswordFormStateCopyWithImpl<_ForgotPasswordFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordFormState&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordFormState(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordFormStateCopyWith<$Res> implements $ForgotPasswordFormStateCopyWith<$Res> {
  factory _$ForgotPasswordFormStateCopyWith(_ForgotPasswordFormState value, $Res Function(_ForgotPasswordFormState) _then) = __$ForgotPasswordFormStateCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ForgotPasswordFormStateCopyWithImpl<$Res>
    implements _$ForgotPasswordFormStateCopyWith<$Res> {
  __$ForgotPasswordFormStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordFormState _self;
  final $Res Function(_ForgotPasswordFormState) _then;

/// Create a copy of ForgotPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ForgotPasswordFormState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
