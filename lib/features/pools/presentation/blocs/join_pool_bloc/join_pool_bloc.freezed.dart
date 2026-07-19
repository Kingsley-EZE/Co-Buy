// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_pool_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JoinPoolEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinPoolEvent()';
}


}

/// @nodoc
class $JoinPoolEventCopyWith<$Res>  {
$JoinPoolEventCopyWith(JoinPoolEvent _, $Res Function(JoinPoolEvent) __);
}


/// Adds pattern-matching-related methods to [JoinPoolEvent].
extension JoinPoolEventPatterns on JoinPoolEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( JoinPoolBanksFetchRequested value)?  banksFetchRequested,TResult Function( JoinPoolAccountLookupRequested value)?  accountLookupRequested,TResult Function( JoinPoolAccountLookupCleared value)?  accountLookupCleared,TResult Function( JoinPoolSubmitRequested value)?  submitRequested,TResult Function( JoinPoolSubmitStateCleared value)?  submitStateCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested(_that);case JoinPoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that);case JoinPoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared(_that);case JoinPoolSubmitRequested() when submitRequested != null:
return submitRequested(_that);case JoinPoolSubmitStateCleared() when submitStateCleared != null:
return submitStateCleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( JoinPoolBanksFetchRequested value)  banksFetchRequested,required TResult Function( JoinPoolAccountLookupRequested value)  accountLookupRequested,required TResult Function( JoinPoolAccountLookupCleared value)  accountLookupCleared,required TResult Function( JoinPoolSubmitRequested value)  submitRequested,required TResult Function( JoinPoolSubmitStateCleared value)  submitStateCleared,}){
final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested():
return banksFetchRequested(_that);case JoinPoolAccountLookupRequested():
return accountLookupRequested(_that);case JoinPoolAccountLookupCleared():
return accountLookupCleared(_that);case JoinPoolSubmitRequested():
return submitRequested(_that);case JoinPoolSubmitStateCleared():
return submitStateCleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( JoinPoolBanksFetchRequested value)?  banksFetchRequested,TResult? Function( JoinPoolAccountLookupRequested value)?  accountLookupRequested,TResult? Function( JoinPoolAccountLookupCleared value)?  accountLookupCleared,TResult? Function( JoinPoolSubmitRequested value)?  submitRequested,TResult? Function( JoinPoolSubmitStateCleared value)?  submitStateCleared,}){
final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested(_that);case JoinPoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that);case JoinPoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared(_that);case JoinPoolSubmitRequested() when submitRequested != null:
return submitRequested(_that);case JoinPoolSubmitStateCleared() when submitStateCleared != null:
return submitStateCleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  banksFetchRequested,TResult Function( String accountNumber,  String bankCode)?  accountLookupRequested,TResult Function()?  accountLookupCleared,TResult Function( JoinPoolRequest request)?  submitRequested,TResult Function()?  submitStateCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested();case JoinPoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that.accountNumber,_that.bankCode);case JoinPoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared();case JoinPoolSubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case JoinPoolSubmitStateCleared() when submitStateCleared != null:
return submitStateCleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  banksFetchRequested,required TResult Function( String accountNumber,  String bankCode)  accountLookupRequested,required TResult Function()  accountLookupCleared,required TResult Function( JoinPoolRequest request)  submitRequested,required TResult Function()  submitStateCleared,}) {final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested():
return banksFetchRequested();case JoinPoolAccountLookupRequested():
return accountLookupRequested(_that.accountNumber,_that.bankCode);case JoinPoolAccountLookupCleared():
return accountLookupCleared();case JoinPoolSubmitRequested():
return submitRequested(_that.request);case JoinPoolSubmitStateCleared():
return submitStateCleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  banksFetchRequested,TResult? Function( String accountNumber,  String bankCode)?  accountLookupRequested,TResult? Function()?  accountLookupCleared,TResult? Function( JoinPoolRequest request)?  submitRequested,TResult? Function()?  submitStateCleared,}) {final _that = this;
switch (_that) {
case JoinPoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested();case JoinPoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that.accountNumber,_that.bankCode);case JoinPoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared();case JoinPoolSubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case JoinPoolSubmitStateCleared() when submitStateCleared != null:
return submitStateCleared();case _:
  return null;

}
}

}

/// @nodoc


class JoinPoolBanksFetchRequested implements JoinPoolEvent {
  const JoinPoolBanksFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolBanksFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinPoolEvent.banksFetchRequested()';
}


}




/// @nodoc


class JoinPoolAccountLookupRequested implements JoinPoolEvent {
  const JoinPoolAccountLookupRequested({required this.accountNumber, required this.bankCode});
  

 final  String accountNumber;
 final  String bankCode;

/// Create a copy of JoinPoolEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolAccountLookupRequestedCopyWith<JoinPoolAccountLookupRequested> get copyWith => _$JoinPoolAccountLookupRequestedCopyWithImpl<JoinPoolAccountLookupRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolAccountLookupRequested&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode));
}


@override
int get hashCode => Object.hash(runtimeType,accountNumber,bankCode);

@override
String toString() {
  return 'JoinPoolEvent.accountLookupRequested(accountNumber: $accountNumber, bankCode: $bankCode)';
}


}

/// @nodoc
abstract mixin class $JoinPoolAccountLookupRequestedCopyWith<$Res> implements $JoinPoolEventCopyWith<$Res> {
  factory $JoinPoolAccountLookupRequestedCopyWith(JoinPoolAccountLookupRequested value, $Res Function(JoinPoolAccountLookupRequested) _then) = _$JoinPoolAccountLookupRequestedCopyWithImpl;
@useResult
$Res call({
 String accountNumber, String bankCode
});




}
/// @nodoc
class _$JoinPoolAccountLookupRequestedCopyWithImpl<$Res>
    implements $JoinPoolAccountLookupRequestedCopyWith<$Res> {
  _$JoinPoolAccountLookupRequestedCopyWithImpl(this._self, this._then);

  final JoinPoolAccountLookupRequested _self;
  final $Res Function(JoinPoolAccountLookupRequested) _then;

/// Create a copy of JoinPoolEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountNumber = null,Object? bankCode = null,}) {
  return _then(JoinPoolAccountLookupRequested(
accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class JoinPoolAccountLookupCleared implements JoinPoolEvent {
  const JoinPoolAccountLookupCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolAccountLookupCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinPoolEvent.accountLookupCleared()';
}


}




/// @nodoc


class JoinPoolSubmitRequested implements JoinPoolEvent {
  const JoinPoolSubmitRequested(this.request);
  

 final  JoinPoolRequest request;

/// Create a copy of JoinPoolEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolSubmitRequestedCopyWith<JoinPoolSubmitRequested> get copyWith => _$JoinPoolSubmitRequestedCopyWithImpl<JoinPoolSubmitRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolSubmitRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'JoinPoolEvent.submitRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class $JoinPoolSubmitRequestedCopyWith<$Res> implements $JoinPoolEventCopyWith<$Res> {
  factory $JoinPoolSubmitRequestedCopyWith(JoinPoolSubmitRequested value, $Res Function(JoinPoolSubmitRequested) _then) = _$JoinPoolSubmitRequestedCopyWithImpl;
@useResult
$Res call({
 JoinPoolRequest request
});




}
/// @nodoc
class _$JoinPoolSubmitRequestedCopyWithImpl<$Res>
    implements $JoinPoolSubmitRequestedCopyWith<$Res> {
  _$JoinPoolSubmitRequestedCopyWithImpl(this._self, this._then);

  final JoinPoolSubmitRequested _self;
  final $Res Function(JoinPoolSubmitRequested) _then;

/// Create a copy of JoinPoolEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(JoinPoolSubmitRequested(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as JoinPoolRequest,
  ));
}


}

/// @nodoc


class JoinPoolSubmitStateCleared implements JoinPoolEvent {
  const JoinPoolSubmitStateCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolSubmitStateCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'JoinPoolEvent.submitStateCleared()';
}


}




/// @nodoc
mixin _$JoinPoolState {

 JoinPoolRequestStatus get banksStatus;/// The in-memory bank cache — once loaded, fetch events are no-ops.
 List<Bank> get banks; String? get banksError; JoinPoolRequestStatus get accountLookupStatus;/// The account resolved by the last name enquiry, cleared when a new
/// lookup starts so a stale name is never shown against fresh input.
 BankAccount? get resolvedAccount; String? get accountLookupError; JoinPoolRequestStatus get joinStatus; String? get joinError;
/// Create a copy of JoinPoolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JoinPoolStateCopyWith<JoinPoolState> get copyWith => _$JoinPoolStateCopyWithImpl<JoinPoolState>(this as JoinPoolState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JoinPoolState&&(identical(other.banksStatus, banksStatus) || other.banksStatus == banksStatus)&&const DeepCollectionEquality().equals(other.banks, banks)&&(identical(other.banksError, banksError) || other.banksError == banksError)&&(identical(other.accountLookupStatus, accountLookupStatus) || other.accountLookupStatus == accountLookupStatus)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount)&&(identical(other.accountLookupError, accountLookupError) || other.accountLookupError == accountLookupError)&&(identical(other.joinStatus, joinStatus) || other.joinStatus == joinStatus)&&(identical(other.joinError, joinError) || other.joinError == joinError));
}


@override
int get hashCode => Object.hash(runtimeType,banksStatus,const DeepCollectionEquality().hash(banks),banksError,accountLookupStatus,resolvedAccount,accountLookupError,joinStatus,joinError);

@override
String toString() {
  return 'JoinPoolState(banksStatus: $banksStatus, banks: $banks, banksError: $banksError, accountLookupStatus: $accountLookupStatus, resolvedAccount: $resolvedAccount, accountLookupError: $accountLookupError, joinStatus: $joinStatus, joinError: $joinError)';
}


}

/// @nodoc
abstract mixin class $JoinPoolStateCopyWith<$Res>  {
  factory $JoinPoolStateCopyWith(JoinPoolState value, $Res Function(JoinPoolState) _then) = _$JoinPoolStateCopyWithImpl;
@useResult
$Res call({
 JoinPoolRequestStatus banksStatus, List<Bank> banks, String? banksError, JoinPoolRequestStatus accountLookupStatus, BankAccount? resolvedAccount, String? accountLookupError, JoinPoolRequestStatus joinStatus, String? joinError
});




}
/// @nodoc
class _$JoinPoolStateCopyWithImpl<$Res>
    implements $JoinPoolStateCopyWith<$Res> {
  _$JoinPoolStateCopyWithImpl(this._self, this._then);

  final JoinPoolState _self;
  final $Res Function(JoinPoolState) _then;

/// Create a copy of JoinPoolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banksStatus = null,Object? banks = null,Object? banksError = freezed,Object? accountLookupStatus = null,Object? resolvedAccount = freezed,Object? accountLookupError = freezed,Object? joinStatus = null,Object? joinError = freezed,}) {
  return _then(JoinPoolState(
banksStatus: null == banksStatus ? _self.banksStatus : banksStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,banks: null == banks ? _self.banks : banks // ignore: cast_nullable_to_non_nullable
as List<Bank>,banksError: freezed == banksError ? _self.banksError : banksError // ignore: cast_nullable_to_non_nullable
as String?,accountLookupStatus: null == accountLookupStatus ? _self.accountLookupStatus : accountLookupStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,accountLookupError: freezed == accountLookupError ? _self.accountLookupError : accountLookupError // ignore: cast_nullable_to_non_nullable
as String?,joinStatus: null == joinStatus ? _self.joinStatus : joinStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,joinError: freezed == joinError ? _self.joinError : joinError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JoinPoolState].
extension JoinPoolStatePatterns on JoinPoolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JoinPoolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JoinPoolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JoinPoolState value)  $default,){
final _that = this;
switch (_that) {
case _JoinPoolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JoinPoolState value)?  $default,){
final _that = this;
switch (_that) {
case _JoinPoolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JoinPoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  JoinPoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  JoinPoolRequestStatus joinStatus,  String? joinError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JoinPoolState() when $default != null:
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.joinStatus,_that.joinError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JoinPoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  JoinPoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  JoinPoolRequestStatus joinStatus,  String? joinError)  $default,) {final _that = this;
switch (_that) {
case _JoinPoolState():
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.joinStatus,_that.joinError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JoinPoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  JoinPoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  JoinPoolRequestStatus joinStatus,  String? joinError)?  $default,) {final _that = this;
switch (_that) {
case _JoinPoolState() when $default != null:
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.joinStatus,_that.joinError);case _:
  return null;

}
}

}

/// @nodoc


class _JoinPoolState extends JoinPoolState {
  const _JoinPoolState({this.banksStatus = JoinPoolRequestStatus.initial,  List<Bank> banks = const <Bank>[], this.banksError, this.accountLookupStatus = JoinPoolRequestStatus.initial, this.resolvedAccount, this.accountLookupError, this.joinStatus = JoinPoolRequestStatus.initial, this.joinError}): _banks = banks,super._();
  

@override@JsonKey() final  JoinPoolRequestStatus banksStatus;
/// The in-memory bank cache — once loaded, fetch events are no-ops.
 final  List<Bank> _banks;
/// The in-memory bank cache — once loaded, fetch events are no-ops.
@override@JsonKey() List<Bank> get banks {
  if (_banks is EqualUnmodifiableListView) return _banks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banks);
}

@override final  String? banksError;
@override@JsonKey() final  JoinPoolRequestStatus accountLookupStatus;
/// The account resolved by the last name enquiry, cleared when a new
/// lookup starts so a stale name is never shown against fresh input.
@override final  BankAccount? resolvedAccount;
@override final  String? accountLookupError;
@override@JsonKey() final  JoinPoolRequestStatus joinStatus;
@override final  String? joinError;

/// Create a copy of JoinPoolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JoinPoolStateCopyWith<_JoinPoolState> get copyWith => __$JoinPoolStateCopyWithImpl<_JoinPoolState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JoinPoolState&&(identical(other.banksStatus, banksStatus) || other.banksStatus == banksStatus)&&const DeepCollectionEquality().equals(other._banks, _banks)&&(identical(other.banksError, banksError) || other.banksError == banksError)&&(identical(other.accountLookupStatus, accountLookupStatus) || other.accountLookupStatus == accountLookupStatus)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount)&&(identical(other.accountLookupError, accountLookupError) || other.accountLookupError == accountLookupError)&&(identical(other.joinStatus, joinStatus) || other.joinStatus == joinStatus)&&(identical(other.joinError, joinError) || other.joinError == joinError));
}


@override
int get hashCode => Object.hash(runtimeType,banksStatus,const DeepCollectionEquality().hash(_banks),banksError,accountLookupStatus,resolvedAccount,accountLookupError,joinStatus,joinError);

@override
String toString() {
  return 'JoinPoolState(banksStatus: $banksStatus, banks: $banks, banksError: $banksError, accountLookupStatus: $accountLookupStatus, resolvedAccount: $resolvedAccount, accountLookupError: $accountLookupError, joinStatus: $joinStatus, joinError: $joinError)';
}


}

/// @nodoc
abstract mixin class _$JoinPoolStateCopyWith<$Res> implements $JoinPoolStateCopyWith<$Res> {
  factory _$JoinPoolStateCopyWith(_JoinPoolState value, $Res Function(_JoinPoolState) _then) = __$JoinPoolStateCopyWithImpl;
@override @useResult
$Res call({
 JoinPoolRequestStatus banksStatus, List<Bank> banks, String? banksError, JoinPoolRequestStatus accountLookupStatus, BankAccount? resolvedAccount, String? accountLookupError, JoinPoolRequestStatus joinStatus, String? joinError
});




}
/// @nodoc
class __$JoinPoolStateCopyWithImpl<$Res>
    implements _$JoinPoolStateCopyWith<$Res> {
  __$JoinPoolStateCopyWithImpl(this._self, this._then);

  final _JoinPoolState _self;
  final $Res Function(_JoinPoolState) _then;

/// Create a copy of JoinPoolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banksStatus = null,Object? banks = null,Object? banksError = freezed,Object? accountLookupStatus = null,Object? resolvedAccount = freezed,Object? accountLookupError = freezed,Object? joinStatus = null,Object? joinError = freezed,}) {
  return _then(_JoinPoolState(
banksStatus: null == banksStatus ? _self.banksStatus : banksStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,banks: null == banks ? _self._banks : banks // ignore: cast_nullable_to_non_nullable
as List<Bank>,banksError: freezed == banksError ? _self.banksError : banksError // ignore: cast_nullable_to_non_nullable
as String?,accountLookupStatus: null == accountLookupStatus ? _self.accountLookupStatus : accountLookupStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,accountLookupError: freezed == accountLookupError ? _self.accountLookupError : accountLookupError // ignore: cast_nullable_to_non_nullable
as String?,joinStatus: null == joinStatus ? _self.joinStatus : joinStatus // ignore: cast_nullable_to_non_nullable
as JoinPoolRequestStatus,joinError: freezed == joinError ? _self.joinError : joinError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
