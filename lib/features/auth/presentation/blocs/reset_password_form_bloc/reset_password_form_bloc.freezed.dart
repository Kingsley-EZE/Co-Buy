// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordFormEvent()';
}


}

/// @nodoc
class $ResetPasswordFormEventCopyWith<$Res>  {
$ResetPasswordFormEventCopyWith(ResetPasswordFormEvent _, $Res Function(ResetPasswordFormEvent) __);
}


/// Adds pattern-matching-related methods to [ResetPasswordFormEvent].
extension ResetPasswordFormEventPatterns on ResetPasswordFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResetPasswordOtpChanged value)?  otpChanged,TResult Function( ResetPasswordNewPasswordChanged value)?  newPasswordChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResetPasswordOtpChanged() when otpChanged != null:
return otpChanged(_that);case ResetPasswordNewPasswordChanged() when newPasswordChanged != null:
return newPasswordChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResetPasswordOtpChanged value)  otpChanged,required TResult Function( ResetPasswordNewPasswordChanged value)  newPasswordChanged,}){
final _that = this;
switch (_that) {
case ResetPasswordOtpChanged():
return otpChanged(_that);case ResetPasswordNewPasswordChanged():
return newPasswordChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResetPasswordOtpChanged value)?  otpChanged,TResult? Function( ResetPasswordNewPasswordChanged value)?  newPasswordChanged,}){
final _that = this;
switch (_that) {
case ResetPasswordOtpChanged() when otpChanged != null:
return otpChanged(_that);case ResetPasswordNewPasswordChanged() when newPasswordChanged != null:
return newPasswordChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String otp)?  otpChanged,TResult Function( String newPassword)?  newPasswordChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResetPasswordOtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case ResetPasswordNewPasswordChanged() when newPasswordChanged != null:
return newPasswordChanged(_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String otp)  otpChanged,required TResult Function( String newPassword)  newPasswordChanged,}) {final _that = this;
switch (_that) {
case ResetPasswordOtpChanged():
return otpChanged(_that.otp);case ResetPasswordNewPasswordChanged():
return newPasswordChanged(_that.newPassword);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String otp)?  otpChanged,TResult? Function( String newPassword)?  newPasswordChanged,}) {final _that = this;
switch (_that) {
case ResetPasswordOtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case ResetPasswordNewPasswordChanged() when newPasswordChanged != null:
return newPasswordChanged(_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc


class ResetPasswordOtpChanged implements ResetPasswordFormEvent {
  const ResetPasswordOtpChanged(this.otp);
  

 final  String otp;

/// Create a copy of ResetPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordOtpChangedCopyWith<ResetPasswordOtpChanged> get copyWith => _$ResetPasswordOtpChangedCopyWithImpl<ResetPasswordOtpChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordOtpChanged&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'ResetPasswordFormEvent.otpChanged(otp: $otp)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordOtpChangedCopyWith<$Res> implements $ResetPasswordFormEventCopyWith<$Res> {
  factory $ResetPasswordOtpChangedCopyWith(ResetPasswordOtpChanged value, $Res Function(ResetPasswordOtpChanged) _then) = _$ResetPasswordOtpChangedCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class _$ResetPasswordOtpChangedCopyWithImpl<$Res>
    implements $ResetPasswordOtpChangedCopyWith<$Res> {
  _$ResetPasswordOtpChangedCopyWithImpl(this._self, this._then);

  final ResetPasswordOtpChanged _self;
  final $Res Function(ResetPasswordOtpChanged) _then;

/// Create a copy of ResetPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(ResetPasswordOtpChanged(
null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetPasswordNewPasswordChanged implements ResetPasswordFormEvent {
  const ResetPasswordNewPasswordChanged(this.newPassword);
  

 final  String newPassword;

/// Create a copy of ResetPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordNewPasswordChangedCopyWith<ResetPasswordNewPasswordChanged> get copyWith => _$ResetPasswordNewPasswordChangedCopyWithImpl<ResetPasswordNewPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordNewPasswordChanged&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,newPassword);

@override
String toString() {
  return 'ResetPasswordFormEvent.newPasswordChanged(newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordNewPasswordChangedCopyWith<$Res> implements $ResetPasswordFormEventCopyWith<$Res> {
  factory $ResetPasswordNewPasswordChangedCopyWith(ResetPasswordNewPasswordChanged value, $Res Function(ResetPasswordNewPasswordChanged) _then) = _$ResetPasswordNewPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String newPassword
});




}
/// @nodoc
class _$ResetPasswordNewPasswordChangedCopyWithImpl<$Res>
    implements $ResetPasswordNewPasswordChangedCopyWith<$Res> {
  _$ResetPasswordNewPasswordChangedCopyWithImpl(this._self, this._then);

  final ResetPasswordNewPasswordChanged _self;
  final $Res Function(ResetPasswordNewPasswordChanged) _then;

/// Create a copy of ResetPasswordFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newPassword = null,}) {
  return _then(ResetPasswordNewPasswordChanged(
null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ResetPasswordFormState {

 String get otp; String get newPassword;
/// Create a copy of ResetPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordFormStateCopyWith<ResetPasswordFormState> get copyWith => _$ResetPasswordFormStateCopyWithImpl<ResetPasswordFormState>(this as ResetPasswordFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordFormState&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,otp,newPassword);

@override
String toString() {
  return 'ResetPasswordFormState(otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordFormStateCopyWith<$Res>  {
  factory $ResetPasswordFormStateCopyWith(ResetPasswordFormState value, $Res Function(ResetPasswordFormState) _then) = _$ResetPasswordFormStateCopyWithImpl;
@useResult
$Res call({
 String otp, String newPassword
});




}
/// @nodoc
class _$ResetPasswordFormStateCopyWithImpl<$Res>
    implements $ResetPasswordFormStateCopyWith<$Res> {
  _$ResetPasswordFormStateCopyWithImpl(this._self, this._then);

  final ResetPasswordFormState _self;
  final $Res Function(ResetPasswordFormState) _then;

/// Create a copy of ResetPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = null,Object? newPassword = null,}) {
  return _then(ResetPasswordFormState(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordFormState].
extension ResetPasswordFormStatePatterns on ResetPasswordFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordFormState value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String otp,  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordFormState() when $default != null:
return $default(_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String otp,  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordFormState():
return $default(_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String otp,  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordFormState() when $default != null:
return $default(_that.otp,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc


class _ResetPasswordFormState extends ResetPasswordFormState {
  const _ResetPasswordFormState({this.otp = '', this.newPassword = ''}): super._();
  

@override@JsonKey() final  String otp;
@override@JsonKey() final  String newPassword;

/// Create a copy of ResetPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordFormStateCopyWith<_ResetPasswordFormState> get copyWith => __$ResetPasswordFormStateCopyWithImpl<_ResetPasswordFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordFormState&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,otp,newPassword);

@override
String toString() {
  return 'ResetPasswordFormState(otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordFormStateCopyWith<$Res> implements $ResetPasswordFormStateCopyWith<$Res> {
  factory _$ResetPasswordFormStateCopyWith(_ResetPasswordFormState value, $Res Function(_ResetPasswordFormState) _then) = __$ResetPasswordFormStateCopyWithImpl;
@override @useResult
$Res call({
 String otp, String newPassword
});




}
/// @nodoc
class __$ResetPasswordFormStateCopyWithImpl<$Res>
    implements _$ResetPasswordFormStateCopyWith<$Res> {
  __$ResetPasswordFormStateCopyWithImpl(this._self, this._then);

  final _ResetPasswordFormState _self;
  final $Res Function(_ResetPasswordFormState) _then;

/// Create a copy of ResetPasswordFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = null,Object? newPassword = null,}) {
  return _then(_ResetPasswordFormState(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
