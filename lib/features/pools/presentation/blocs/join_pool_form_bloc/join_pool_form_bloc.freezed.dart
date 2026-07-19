// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_pool_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JoinPoolFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinPoolFormEvent()';
}


}

/// @nodoc
class $JoinPoolFormEventCopyWith<$Res>  {
$JoinPoolFormEventCopyWith(JoinPoolFormEvent _, $Res Function(JoinPoolFormEvent) __);
}


/// Adds pattern-matching-related methods to [JoinPoolFormEvent].
extension JoinPoolFormEventPatterns on JoinPoolFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( JoinPoolBankChanged value)?  bankChanged,TResult Function( JoinPoolAccountNumberChanged value)?  accountNumberChanged,TResult Function( JoinPoolAccountLookupResultChanged value)?  accountLookupResultChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case JoinPoolBankChanged() when bankChanged != null:
return bankChanged(_that);case JoinPoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that);case JoinPoolAccountLookupResultChanged() when accountLookupResultChanged != null:
return accountLookupResultChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( JoinPoolBankChanged value)  bankChanged,required TResult Function( JoinPoolAccountNumberChanged value)  accountNumberChanged,required TResult Function( JoinPoolAccountLookupResultChanged value)  accountLookupResultChanged,}){
final _that = this;
switch (_that) {
case JoinPoolBankChanged():
return bankChanged(_that);case JoinPoolAccountNumberChanged():
return accountNumberChanged(_that);case JoinPoolAccountLookupResultChanged():
return accountLookupResultChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( JoinPoolBankChanged value)?  bankChanged,TResult? Function( JoinPoolAccountNumberChanged value)?  accountNumberChanged,TResult? Function( JoinPoolAccountLookupResultChanged value)?  accountLookupResultChanged,}){
final _that = this;
switch (_that) {
case JoinPoolBankChanged() when bankChanged != null:
return bankChanged(_that);case JoinPoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that);case JoinPoolAccountLookupResultChanged() when accountLookupResultChanged != null:
return accountLookupResultChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Bank bank)?  bankChanged,TResult Function( String accountNumber)?  accountNumberChanged,TResult Function( BankAccount? account)?  accountLookupResultChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case JoinPoolBankChanged() when bankChanged != null:
return bankChanged(_that.bank);case JoinPoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that.accountNumber);case JoinPoolAccountLookupResultChanged() when accountLookupResultChanged != null:
return accountLookupResultChanged(_that.account);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Bank bank)  bankChanged,required TResult Function( String accountNumber)  accountNumberChanged,required TResult Function( BankAccount? account)  accountLookupResultChanged,}) {final _that = this;
switch (_that) {
case JoinPoolBankChanged():
return bankChanged(_that.bank);case JoinPoolAccountNumberChanged():
return accountNumberChanged(_that.accountNumber);case JoinPoolAccountLookupResultChanged():
return accountLookupResultChanged(_that.account);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Bank bank)?  bankChanged,TResult? Function( String accountNumber)?  accountNumberChanged,TResult? Function( BankAccount? account)?  accountLookupResultChanged,}) {final _that = this;
switch (_that) {
case JoinPoolBankChanged() when bankChanged != null:
return bankChanged(_that.bank);case JoinPoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that.accountNumber);case JoinPoolAccountLookupResultChanged() when accountLookupResultChanged != null:
return accountLookupResultChanged(_that.account);case _:
  return null;

}
}

}

/// @nodoc


class JoinPoolBankChanged implements JoinPoolFormEvent {
  const JoinPoolBankChanged(this.bank);
  

 final  Bank bank;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolBankChangedCopyWith<JoinPoolBankChanged> get copyWith => _$JoinPoolBankChangedCopyWithImpl<JoinPoolBankChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolBankChanged&&(identical(other.bank, bank) || other.bank == bank));
}


@override
int get hashCode => Object.hash(runtimeType,bank);

@override
String toString() {
  return 'JoinPoolFormEvent.bankChanged(bank: $bank)';
}


}

/// @nodoc
abstract mixin class $JoinPoolBankChangedCopyWith<$Res> implements $JoinPoolFormEventCopyWith<$Res> {
  factory $JoinPoolBankChangedCopyWith(JoinPoolBankChanged value, $Res Function(JoinPoolBankChanged) _then) = _$JoinPoolBankChangedCopyWithImpl;
@useResult
$Res call({
 Bank bank
});




}
/// @nodoc
class _$JoinPoolBankChangedCopyWithImpl<$Res>
    implements $JoinPoolBankChangedCopyWith<$Res> {
  _$JoinPoolBankChangedCopyWithImpl(this._self, this._then);

  final JoinPoolBankChanged _self;
  final $Res Function(JoinPoolBankChanged) _then;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bank = null,}) {
  return _then(JoinPoolBankChanged(
null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank,
  ));
}


}

/// @nodoc


class JoinPoolAccountNumberChanged implements JoinPoolFormEvent {
  const JoinPoolAccountNumberChanged(this.accountNumber);
  

 final  String accountNumber;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolAccountNumberChangedCopyWith<JoinPoolAccountNumberChanged> get copyWith => _$JoinPoolAccountNumberChangedCopyWithImpl<JoinPoolAccountNumberChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolAccountNumberChanged&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}


@override
int get hashCode => Object.hash(runtimeType,accountNumber);

@override
String toString() {
  return 'JoinPoolFormEvent.accountNumberChanged(accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $JoinPoolAccountNumberChangedCopyWith<$Res> implements $JoinPoolFormEventCopyWith<$Res> {
  factory $JoinPoolAccountNumberChangedCopyWith(JoinPoolAccountNumberChanged value, $Res Function(JoinPoolAccountNumberChanged) _then) = _$JoinPoolAccountNumberChangedCopyWithImpl;
@useResult
$Res call({
 String accountNumber
});




}
/// @nodoc
class _$JoinPoolAccountNumberChangedCopyWithImpl<$Res>
    implements $JoinPoolAccountNumberChangedCopyWith<$Res> {
  _$JoinPoolAccountNumberChangedCopyWithImpl(this._self, this._then);

  final JoinPoolAccountNumberChanged _self;
  final $Res Function(JoinPoolAccountNumberChanged) _then;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountNumber = null,}) {
  return _then(JoinPoolAccountNumberChanged(
null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class JoinPoolAccountLookupResultChanged implements JoinPoolFormEvent {
  const JoinPoolAccountLookupResultChanged(this.account);
  

 final  BankAccount? account;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolAccountLookupResultChangedCopyWith<JoinPoolAccountLookupResultChanged> get copyWith => _$JoinPoolAccountLookupResultChangedCopyWithImpl<JoinPoolAccountLookupResultChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolAccountLookupResultChanged&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'JoinPoolFormEvent.accountLookupResultChanged(account: $account)';
}


}

/// @nodoc
abstract mixin class $JoinPoolAccountLookupResultChangedCopyWith<$Res> implements $JoinPoolFormEventCopyWith<$Res> {
  factory $JoinPoolAccountLookupResultChangedCopyWith(JoinPoolAccountLookupResultChanged value, $Res Function(JoinPoolAccountLookupResultChanged) _then) = _$JoinPoolAccountLookupResultChangedCopyWithImpl;
@useResult
$Res call({
 BankAccount? account
});




}
/// @nodoc
class _$JoinPoolAccountLookupResultChangedCopyWithImpl<$Res>
    implements $JoinPoolAccountLookupResultChangedCopyWith<$Res> {
  _$JoinPoolAccountLookupResultChangedCopyWithImpl(this._self, this._then);

  final JoinPoolAccountLookupResultChanged _self;
  final $Res Function(JoinPoolAccountLookupResultChanged) _then;

/// Create a copy of JoinPoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = freezed,}) {
  return _then(JoinPoolAccountLookupResultChanged(
freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}


}

/// @nodoc
mixin _$JoinPoolFormState {

/// The whole entity (not just a display name) so the bank code is on hand
/// for the account name enquiry and submission.
 Bank? get bank; String get accountNumber;/// The account the bank name enquiry resolved, mirrored in from
/// [JoinPoolBloc] by the page so [canSubmit] can require verification.
 BankAccount? get resolvedAccount;
/// Create a copy of JoinPoolFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolFormStateCopyWith<JoinPoolFormState> get copyWith => _$JoinPoolFormStateCopyWithImpl<JoinPoolFormState>(this as JoinPoolFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolFormState&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount));
}


@override
int get hashCode => Object.hash(runtimeType,bank,accountNumber,resolvedAccount);

@override
String toString() {
  return 'JoinPoolFormState(bank: $bank, accountNumber: $accountNumber, resolvedAccount: $resolvedAccount)';
}


}

/// @nodoc
abstract mixin class $JoinPoolFormStateCopyWith<$Res>  {
  factory $JoinPoolFormStateCopyWith(JoinPoolFormState value, $Res Function(JoinPoolFormState) _then) = _$JoinPoolFormStateCopyWithImpl;
@useResult
$Res call({
 Bank? bank, String accountNumber, BankAccount? resolvedAccount
});




}
/// @nodoc
class _$JoinPoolFormStateCopyWithImpl<$Res>
    implements $JoinPoolFormStateCopyWith<$Res> {
  _$JoinPoolFormStateCopyWithImpl(this._self, this._then);

  final JoinPoolFormState _self;
  final $Res Function(JoinPoolFormState) _then;

/// Create a copy of JoinPoolFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bank = freezed,Object? accountNumber = null,Object? resolvedAccount = freezed,}) {
  return _then(JoinPoolFormState(
bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}

}


/// Adds pattern-matching-related methods to [JoinPoolFormState].
extension JoinPoolFormStatePatterns on JoinPoolFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JoinPoolFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinPoolFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JoinPoolFormState value)  $default,){
final _that = this;
switch (_that) {
case _JoinPoolFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JoinPoolFormState value)?  $default,){
final _that = this;
switch (_that) {
case _JoinPoolFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinPoolFormState() when $default != null:
return $default(_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)  $default,) {final _that = this;
switch (_that) {
case _JoinPoolFormState():
return $default(_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)?  $default,) {final _that = this;
switch (_that) {
case _JoinPoolFormState() when $default != null:
return $default(_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
  return null;

}
}

}

/// @nodoc


class _JoinPoolFormState extends JoinPoolFormState {
  const _JoinPoolFormState({this.bank, this.accountNumber = '', this.resolvedAccount}): super._();
  

/// The whole entity (not just a display name) so the bank code is on hand
/// for the account name enquiry and submission.
@override final  Bank? bank;
@override@JsonKey() final  String accountNumber;
/// The account the bank name enquiry resolved, mirrored in from
/// [JoinPoolBloc] by the page so [canSubmit] can require verification.
@override final  BankAccount? resolvedAccount;

/// Create a copy of JoinPoolFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinPoolFormStateCopyWith<_JoinPoolFormState> get copyWith => __$JoinPoolFormStateCopyWithImpl<_JoinPoolFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinPoolFormState&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount));
}


@override
int get hashCode => Object.hash(runtimeType,bank,accountNumber,resolvedAccount);

@override
String toString() {
  return 'JoinPoolFormState(bank: $bank, accountNumber: $accountNumber, resolvedAccount: $resolvedAccount)';
}


}

/// @nodoc
abstract mixin class _$JoinPoolFormStateCopyWith<$Res> implements $JoinPoolFormStateCopyWith<$Res> {
  factory _$JoinPoolFormStateCopyWith(_JoinPoolFormState value, $Res Function(_JoinPoolFormState) _then) = __$JoinPoolFormStateCopyWithImpl;
@override @useResult
$Res call({
 Bank? bank, String accountNumber, BankAccount? resolvedAccount
});




}
/// @nodoc
class __$JoinPoolFormStateCopyWithImpl<$Res>
    implements _$JoinPoolFormStateCopyWith<$Res> {
  __$JoinPoolFormStateCopyWithImpl(this._self, this._then);

  final _JoinPoolFormState _self;
  final $Res Function(_JoinPoolFormState) _then;

/// Create a copy of JoinPoolFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bank = freezed,Object? accountNumber = null,Object? resolvedAccount = freezed,}) {
  return _then(_JoinPoolFormState(
bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}


}

// dart format on
