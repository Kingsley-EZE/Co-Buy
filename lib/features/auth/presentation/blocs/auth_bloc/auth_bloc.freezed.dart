// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthLoginRequested value)?  loginRequested,TResult Function( AuthSignupRequested value)?  signupRequested,TResult Function( AuthVerifyEmailRequested value)?  verifyEmailRequested,TResult Function( AuthResendOtpRequested value)?  resendOtpRequested,TResult Function( AuthForgotPasswordRequested value)?  forgotPasswordRequested,TResult Function( AuthResetPasswordRequested value)?  resetPasswordRequested,TResult Function( AuthLogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthSignupRequested() when signupRequested != null:
return signupRequested(_that);case AuthVerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that);case AuthResendOtpRequested() when resendOtpRequested != null:
return resendOtpRequested(_that);case AuthForgotPasswordRequested() when forgotPasswordRequested != null:
return forgotPasswordRequested(_that);case AuthResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthLoginRequested value)  loginRequested,required TResult Function( AuthSignupRequested value)  signupRequested,required TResult Function( AuthVerifyEmailRequested value)  verifyEmailRequested,required TResult Function( AuthResendOtpRequested value)  resendOtpRequested,required TResult Function( AuthForgotPasswordRequested value)  forgotPasswordRequested,required TResult Function( AuthResetPasswordRequested value)  resetPasswordRequested,required TResult Function( AuthLogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthLoginRequested():
return loginRequested(_that);case AuthSignupRequested():
return signupRequested(_that);case AuthVerifyEmailRequested():
return verifyEmailRequested(_that);case AuthResendOtpRequested():
return resendOtpRequested(_that);case AuthForgotPasswordRequested():
return forgotPasswordRequested(_that);case AuthResetPasswordRequested():
return resetPasswordRequested(_that);case AuthLogoutRequested():
return logoutRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthLoginRequested value)?  loginRequested,TResult? Function( AuthSignupRequested value)?  signupRequested,TResult? Function( AuthVerifyEmailRequested value)?  verifyEmailRequested,TResult? Function( AuthResendOtpRequested value)?  resendOtpRequested,TResult? Function( AuthForgotPasswordRequested value)?  forgotPasswordRequested,TResult? Function( AuthResetPasswordRequested value)?  resetPasswordRequested,TResult? Function( AuthLogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthSignupRequested() when signupRequested != null:
return signupRequested(_that);case AuthVerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that);case AuthResendOtpRequested() when resendOtpRequested != null:
return resendOtpRequested(_that);case AuthForgotPasswordRequested() when forgotPasswordRequested != null:
return forgotPasswordRequested(_that);case AuthResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  loginRequested,TResult Function( String firstName,  String lastName,  String email,  String password)?  signupRequested,TResult Function( String email,  String otp)?  verifyEmailRequested,TResult Function( String email)?  resendOtpRequested,TResult Function( String email)?  forgotPasswordRequested,TResult Function( String email,  String otp,  String newPassword)?  resetPasswordRequested,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case AuthSignupRequested() when signupRequested != null:
return signupRequested(_that.firstName,_that.lastName,_that.email,_that.password);case AuthVerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that.email,_that.otp);case AuthResendOtpRequested() when resendOtpRequested != null:
return resendOtpRequested(_that.email);case AuthForgotPasswordRequested() when forgotPasswordRequested != null:
return forgotPasswordRequested(_that.email);case AuthResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that.email,_that.otp,_that.newPassword);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  loginRequested,required TResult Function( String firstName,  String lastName,  String email,  String password)  signupRequested,required TResult Function( String email,  String otp)  verifyEmailRequested,required TResult Function( String email)  resendOtpRequested,required TResult Function( String email)  forgotPasswordRequested,required TResult Function( String email,  String otp,  String newPassword)  resetPasswordRequested,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthLoginRequested():
return loginRequested(_that.email,_that.password);case AuthSignupRequested():
return signupRequested(_that.firstName,_that.lastName,_that.email,_that.password);case AuthVerifyEmailRequested():
return verifyEmailRequested(_that.email,_that.otp);case AuthResendOtpRequested():
return resendOtpRequested(_that.email);case AuthForgotPasswordRequested():
return forgotPasswordRequested(_that.email);case AuthResetPasswordRequested():
return resetPasswordRequested(_that.email,_that.otp,_that.newPassword);case AuthLogoutRequested():
return logoutRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  loginRequested,TResult? Function( String firstName,  String lastName,  String email,  String password)?  signupRequested,TResult? Function( String email,  String otp)?  verifyEmailRequested,TResult? Function( String email)?  resendOtpRequested,TResult? Function( String email)?  forgotPasswordRequested,TResult? Function( String email,  String otp,  String newPassword)?  resetPasswordRequested,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case AuthSignupRequested() when signupRequested != null:
return signupRequested(_that.firstName,_that.lastName,_that.email,_that.password);case AuthVerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that.email,_that.otp);case AuthResendOtpRequested() when resendOtpRequested != null:
return resendOtpRequested(_that.email);case AuthForgotPasswordRequested() when forgotPasswordRequested != null:
return forgotPasswordRequested(_that.email);case AuthResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that.email,_that.otp,_that.newPassword);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class AuthLoginRequested implements AuthEvent {
  const AuthLoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginRequestedCopyWith<AuthLoginRequested> get copyWith => _$AuthLoginRequestedCopyWithImpl<AuthLoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginRequestedCopyWith(AuthLoginRequested value, $Res Function(AuthLoginRequested) _then) = _$AuthLoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthLoginRequestedCopyWithImpl<$Res>
    implements $AuthLoginRequestedCopyWith<$Res> {
  _$AuthLoginRequestedCopyWithImpl(this._self, this._then);

  final AuthLoginRequested _self;
  final $Res Function(AuthLoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthLoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthSignupRequested implements AuthEvent {
  const AuthSignupRequested({required this.firstName, required this.lastName, required this.email, required this.password});
  

 final  String firstName;
 final  String lastName;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSignupRequestedCopyWith<AuthSignupRequested> get copyWith => _$AuthSignupRequestedCopyWithImpl<AuthSignupRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSignupRequested&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password);

@override
String toString() {
  return 'AuthEvent.signupRequested(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthSignupRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSignupRequestedCopyWith(AuthSignupRequested value, $Res Function(AuthSignupRequested) _then) = _$AuthSignupRequestedCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String password
});




}
/// @nodoc
class _$AuthSignupRequestedCopyWithImpl<$Res>
    implements $AuthSignupRequestedCopyWith<$Res> {
  _$AuthSignupRequestedCopyWithImpl(this._self, this._then);

  final AuthSignupRequested _self;
  final $Res Function(AuthSignupRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,}) {
  return _then(AuthSignupRequested(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthVerifyEmailRequested implements AuthEvent {
  const AuthVerifyEmailRequested({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthVerifyEmailRequestedCopyWith<AuthVerifyEmailRequested> get copyWith => _$AuthVerifyEmailRequestedCopyWithImpl<AuthVerifyEmailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthVerifyEmailRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'AuthEvent.verifyEmailRequested(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $AuthVerifyEmailRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthVerifyEmailRequestedCopyWith(AuthVerifyEmailRequested value, $Res Function(AuthVerifyEmailRequested) _then) = _$AuthVerifyEmailRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$AuthVerifyEmailRequestedCopyWithImpl<$Res>
    implements $AuthVerifyEmailRequestedCopyWith<$Res> {
  _$AuthVerifyEmailRequestedCopyWithImpl(this._self, this._then);

  final AuthVerifyEmailRequested _self;
  final $Res Function(AuthVerifyEmailRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(AuthVerifyEmailRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthResendOtpRequested implements AuthEvent {
  const AuthResendOtpRequested({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResendOtpRequestedCopyWith<AuthResendOtpRequested> get copyWith => _$AuthResendOtpRequestedCopyWithImpl<AuthResendOtpRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResendOtpRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.resendOtpRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthResendOtpRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthResendOtpRequestedCopyWith(AuthResendOtpRequested value, $Res Function(AuthResendOtpRequested) _then) = _$AuthResendOtpRequestedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthResendOtpRequestedCopyWithImpl<$Res>
    implements $AuthResendOtpRequestedCopyWith<$Res> {
  _$AuthResendOtpRequestedCopyWithImpl(this._self, this._then);

  final AuthResendOtpRequested _self;
  final $Res Function(AuthResendOtpRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthResendOtpRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthForgotPasswordRequested implements AuthEvent {
  const AuthForgotPasswordRequested({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthForgotPasswordRequestedCopyWith<AuthForgotPasswordRequested> get copyWith => _$AuthForgotPasswordRequestedCopyWithImpl<AuthForgotPasswordRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthForgotPasswordRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.forgotPasswordRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthForgotPasswordRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthForgotPasswordRequestedCopyWith(AuthForgotPasswordRequested value, $Res Function(AuthForgotPasswordRequested) _then) = _$AuthForgotPasswordRequestedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthForgotPasswordRequestedCopyWithImpl<$Res>
    implements $AuthForgotPasswordRequestedCopyWith<$Res> {
  _$AuthForgotPasswordRequestedCopyWithImpl(this._self, this._then);

  final AuthForgotPasswordRequested _self;
  final $Res Function(AuthForgotPasswordRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthForgotPasswordRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthResetPasswordRequested implements AuthEvent {
  const AuthResetPasswordRequested({required this.email, required this.otp, required this.newPassword});
  

 final  String email;
 final  String otp;
 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResetPasswordRequestedCopyWith<AuthResetPasswordRequested> get copyWith => _$AuthResetPasswordRequestedCopyWithImpl<AuthResetPasswordRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResetPasswordRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp,newPassword);

@override
String toString() {
  return 'AuthEvent.resetPasswordRequested(email: $email, otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $AuthResetPasswordRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthResetPasswordRequestedCopyWith(AuthResetPasswordRequested value, $Res Function(AuthResetPasswordRequested) _then) = _$AuthResetPasswordRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String otp, String newPassword
});




}
/// @nodoc
class _$AuthResetPasswordRequestedCopyWithImpl<$Res>
    implements $AuthResetPasswordRequestedCopyWith<$Res> {
  _$AuthResetPasswordRequestedCopyWithImpl(this._self, this._then);

  final AuthResetPasswordRequested _self;
  final $Res Function(AuthResetPasswordRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? newPassword = null,}) {
  return _then(AuthResetPasswordRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLogoutRequested implements AuthEvent {
  const AuthLogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( AuthAuthenticated value)?  authenticated,TResult Function( AuthSuccess value)?  success,TResult Function( AuthFailure value)?  failure,TResult Function( AuthResendOtpSuccess value)?  resendOtpSuccess,TResult Function( AuthResendOtpFailure value)?  resendOtpFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthSuccess() when success != null:
return success(_that);case AuthFailure() when failure != null:
return failure(_that);case AuthResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that);case AuthResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( AuthAuthenticated value)  authenticated,required TResult Function( AuthSuccess value)  success,required TResult Function( AuthFailure value)  failure,required TResult Function( AuthResendOtpSuccess value)  resendOtpSuccess,required TResult Function( AuthResendOtpFailure value)  resendOtpFailure,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case AuthAuthenticated():
return authenticated(_that);case AuthSuccess():
return success(_that);case AuthFailure():
return failure(_that);case AuthResendOtpSuccess():
return resendOtpSuccess(_that);case AuthResendOtpFailure():
return resendOtpFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( AuthAuthenticated value)?  authenticated,TResult? Function( AuthSuccess value)?  success,TResult? Function( AuthFailure value)?  failure,TResult? Function( AuthResendOtpSuccess value)?  resendOtpSuccess,TResult? Function( AuthResendOtpFailure value)?  resendOtpFailure,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthSuccess() when success != null:
return success(_that);case AuthFailure() when failure != null:
return failure(_that);case AuthResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess(_that);case AuthResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  authenticated,TResult Function()?  success,TResult Function( String message)?  failure,TResult Function()?  resendOtpSuccess,TResult Function( String message)?  resendOtpFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user);case AuthSuccess() when success != null:
return success();case AuthFailure() when failure != null:
return failure(_that.message);case AuthResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess();case AuthResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  authenticated,required TResult Function()  success,required TResult Function( String message)  failure,required TResult Function()  resendOtpSuccess,required TResult Function( String message)  resendOtpFailure,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading();case AuthAuthenticated():
return authenticated(_that.user);case AuthSuccess():
return success();case AuthFailure():
return failure(_that.message);case AuthResendOtpSuccess():
return resendOtpSuccess();case AuthResendOtpFailure():
return resendOtpFailure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  authenticated,TResult? Function()?  success,TResult? Function( String message)?  failure,TResult? Function()?  resendOtpSuccess,TResult? Function( String message)?  resendOtpFailure,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user);case AuthSuccess() when success != null:
return success();case AuthFailure() when failure != null:
return failure(_that.message);case AuthResendOtpSuccess() when resendOtpSuccess != null:
return resendOtpSuccess();case AuthResendOtpFailure() when resendOtpFailure != null:
return resendOtpFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthAuthenticated implements AuthState {
  const AuthAuthenticated(this.user);
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});




}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthAuthenticated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class AuthSuccess implements AuthState {
  const AuthSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.success()';
}


}




/// @nodoc


class AuthFailure implements AuthState {
  const AuthFailure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthResendOtpSuccess implements AuthState {
  const AuthResendOtpSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResendOtpSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.resendOtpSuccess()';
}


}




/// @nodoc


class AuthResendOtpFailure implements AuthState {
  const AuthResendOtpFailure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResendOtpFailureCopyWith<AuthResendOtpFailure> get copyWith => _$AuthResendOtpFailureCopyWithImpl<AuthResendOtpFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResendOtpFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.resendOtpFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthResendOtpFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthResendOtpFailureCopyWith(AuthResendOtpFailure value, $Res Function(AuthResendOtpFailure) _then) = _$AuthResendOtpFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthResendOtpFailureCopyWithImpl<$Res>
    implements $AuthResendOtpFailureCopyWith<$Res> {
  _$AuthResendOtpFailureCopyWithImpl(this._self, this._then);

  final AuthResendOtpFailure _self;
  final $Res Function(AuthResendOtpFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthResendOtpFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
