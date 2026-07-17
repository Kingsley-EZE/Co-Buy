// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupFormEvent()';
}


}

/// @nodoc
class $SignupFormEventCopyWith<$Res>  {
$SignupFormEventCopyWith(SignupFormEvent _, $Res Function(SignupFormEvent) __);
}


/// Adds pattern-matching-related methods to [SignupFormEvent].
extension SignupFormEventPatterns on SignupFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupFirstNameChanged value)?  firstNameChanged,TResult Function( SignupLastNameChanged value)?  lastNameChanged,TResult Function( SignupEmailChanged value)?  emailChanged,TResult Function( SignupPasswordChanged value)?  passwordChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case SignupLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case SignupEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignupPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupFirstNameChanged value)  firstNameChanged,required TResult Function( SignupLastNameChanged value)  lastNameChanged,required TResult Function( SignupEmailChanged value)  emailChanged,required TResult Function( SignupPasswordChanged value)  passwordChanged,}){
final _that = this;
switch (_that) {
case SignupFirstNameChanged():
return firstNameChanged(_that);case SignupLastNameChanged():
return lastNameChanged(_that);case SignupEmailChanged():
return emailChanged(_that);case SignupPasswordChanged():
return passwordChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupFirstNameChanged value)?  firstNameChanged,TResult? Function( SignupLastNameChanged value)?  lastNameChanged,TResult? Function( SignupEmailChanged value)?  emailChanged,TResult? Function( SignupPasswordChanged value)?  passwordChanged,}){
final _that = this;
switch (_that) {
case SignupFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case SignupLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case SignupEmailChanged() when emailChanged != null:
return emailChanged(_that);case SignupPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String firstName)?  firstNameChanged,TResult Function( String lastName)?  lastNameChanged,TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignupFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.firstName);case SignupLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.lastName);case SignupEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignupPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String firstName)  firstNameChanged,required TResult Function( String lastName)  lastNameChanged,required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,}) {final _that = this;
switch (_that) {
case SignupFirstNameChanged():
return firstNameChanged(_that.firstName);case SignupLastNameChanged():
return lastNameChanged(_that.lastName);case SignupEmailChanged():
return emailChanged(_that.email);case SignupPasswordChanged():
return passwordChanged(_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String firstName)?  firstNameChanged,TResult? Function( String lastName)?  lastNameChanged,TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,}) {final _that = this;
switch (_that) {
case SignupFirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.firstName);case SignupLastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.lastName);case SignupEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case SignupPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _:
  return null;

}
}

}

/// @nodoc


class SignupFirstNameChanged implements SignupFormEvent {
  const SignupFirstNameChanged(this.firstName);
  

 final  String firstName;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFirstNameChangedCopyWith<SignupFirstNameChanged> get copyWith => _$SignupFirstNameChangedCopyWithImpl<SignupFirstNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFirstNameChanged&&(identical(other.firstName, firstName) || other.firstName == firstName));
}


@override
int get hashCode => Object.hash(runtimeType,firstName);

@override
String toString() {
  return 'SignupFormEvent.firstNameChanged(firstName: $firstName)';
}


}

/// @nodoc
abstract mixin class $SignupFirstNameChangedCopyWith<$Res> implements $SignupFormEventCopyWith<$Res> {
  factory $SignupFirstNameChangedCopyWith(SignupFirstNameChanged value, $Res Function(SignupFirstNameChanged) _then) = _$SignupFirstNameChangedCopyWithImpl;
@useResult
$Res call({
 String firstName
});




}
/// @nodoc
class _$SignupFirstNameChangedCopyWithImpl<$Res>
    implements $SignupFirstNameChangedCopyWith<$Res> {
  _$SignupFirstNameChangedCopyWithImpl(this._self, this._then);

  final SignupFirstNameChanged _self;
  final $Res Function(SignupFirstNameChanged) _then;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,}) {
  return _then(SignupFirstNameChanged(
null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupLastNameChanged implements SignupFormEvent {
  const SignupLastNameChanged(this.lastName);
  

 final  String lastName;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupLastNameChangedCopyWith<SignupLastNameChanged> get copyWith => _$SignupLastNameChangedCopyWithImpl<SignupLastNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLastNameChanged&&(identical(other.lastName, lastName) || other.lastName == lastName));
}


@override
int get hashCode => Object.hash(runtimeType,lastName);

@override
String toString() {
  return 'SignupFormEvent.lastNameChanged(lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $SignupLastNameChangedCopyWith<$Res> implements $SignupFormEventCopyWith<$Res> {
  factory $SignupLastNameChangedCopyWith(SignupLastNameChanged value, $Res Function(SignupLastNameChanged) _then) = _$SignupLastNameChangedCopyWithImpl;
@useResult
$Res call({
 String lastName
});




}
/// @nodoc
class _$SignupLastNameChangedCopyWithImpl<$Res>
    implements $SignupLastNameChangedCopyWith<$Res> {
  _$SignupLastNameChangedCopyWithImpl(this._self, this._then);

  final SignupLastNameChanged _self;
  final $Res Function(SignupLastNameChanged) _then;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lastName = null,}) {
  return _then(SignupLastNameChanged(
null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupEmailChanged implements SignupFormEvent {
  const SignupEmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupEmailChangedCopyWith<SignupEmailChanged> get copyWith => _$SignupEmailChangedCopyWithImpl<SignupEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignupFormEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $SignupEmailChangedCopyWith<$Res> implements $SignupFormEventCopyWith<$Res> {
  factory $SignupEmailChangedCopyWith(SignupEmailChanged value, $Res Function(SignupEmailChanged) _then) = _$SignupEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SignupEmailChangedCopyWithImpl<$Res>
    implements $SignupEmailChangedCopyWith<$Res> {
  _$SignupEmailChangedCopyWithImpl(this._self, this._then);

  final SignupEmailChanged _self;
  final $Res Function(SignupEmailChanged) _then;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(SignupEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupPasswordChanged implements SignupFormEvent {
  const SignupPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupPasswordChangedCopyWith<SignupPasswordChanged> get copyWith => _$SignupPasswordChangedCopyWithImpl<SignupPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SignupFormEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupPasswordChangedCopyWith<$Res> implements $SignupFormEventCopyWith<$Res> {
  factory $SignupPasswordChangedCopyWith(SignupPasswordChanged value, $Res Function(SignupPasswordChanged) _then) = _$SignupPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$SignupPasswordChangedCopyWithImpl<$Res>
    implements $SignupPasswordChangedCopyWith<$Res> {
  _$SignupPasswordChangedCopyWithImpl(this._self, this._then);

  final SignupPasswordChanged _self;
  final $Res Function(SignupPasswordChanged) _then;

/// Create a copy of SignupFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(SignupPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SignupFormState {

 String get firstName; String get lastName; String get email; String get password;
/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFormStateCopyWith<SignupFormState> get copyWith => _$SignupFormStateCopyWithImpl<SignupFormState>(this as SignupFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFormState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password);

@override
String toString() {
  return 'SignupFormState(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupFormStateCopyWith<$Res>  {
  factory $SignupFormStateCopyWith(SignupFormState value, $Res Function(SignupFormState) _then) = _$SignupFormStateCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String password
});




}
/// @nodoc
class _$SignupFormStateCopyWithImpl<$Res>
    implements $SignupFormStateCopyWith<$Res> {
  _$SignupFormStateCopyWithImpl(this._self, this._then);

  final SignupFormState _self;
  final $Res Function(SignupFormState) _then;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,}) {
  return _then(SignupFormState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupFormState].
extension SignupFormStatePatterns on SignupFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupFormState value)  $default,){
final _that = this;
switch (_that) {
case _SignupFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _SignupFormState():
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _SignupFormState extends SignupFormState {
  const _SignupFormState({this.firstName = '', this.lastName = '', this.email = '', this.password = ''}): super._();
  

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupFormStateCopyWith<_SignupFormState> get copyWith => __$SignupFormStateCopyWithImpl<_SignupFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupFormState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password);

@override
String toString() {
  return 'SignupFormState(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignupFormStateCopyWith<$Res> implements $SignupFormStateCopyWith<$Res> {
  factory _$SignupFormStateCopyWith(_SignupFormState value, $Res Function(_SignupFormState) _then) = __$SignupFormStateCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String password
});




}
/// @nodoc
class __$SignupFormStateCopyWithImpl<$Res>
    implements _$SignupFormStateCopyWith<$Res> {
  __$SignupFormStateCopyWithImpl(this._self, this._then);

  final _SignupFormState _self;
  final $Res Function(_SignupFormState) _then;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,}) {
  return _then(_SignupFormState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
