// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_pool_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePoolEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolEvent()';
}


}

/// @nodoc
class $CreatePoolEventCopyWith<$Res>  {
$CreatePoolEventCopyWith(CreatePoolEvent _, $Res Function(CreatePoolEvent) __);
}


/// Adds pattern-matching-related methods to [CreatePoolEvent].
extension CreatePoolEventPatterns on CreatePoolEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePoolBanksFetchRequested value)?  banksFetchRequested,TResult Function( CreatePoolCategoriesFetchRequested value)?  categoriesFetchRequested,TResult Function( CreatePoolAccountLookupRequested value)?  accountLookupRequested,TResult Function( CreatePoolAccountLookupCleared value)?  accountLookupCleared,TResult Function( CreatePoolSubmitRequested value)?  submitRequested,TResult Function( CreatePoolSubmitStateCleared value)?  submitStateCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested(_that);case CreatePoolCategoriesFetchRequested() when categoriesFetchRequested != null:
return categoriesFetchRequested(_that);case CreatePoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that);case CreatePoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared(_that);case CreatePoolSubmitRequested() when submitRequested != null:
return submitRequested(_that);case CreatePoolSubmitStateCleared() when submitStateCleared != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePoolBanksFetchRequested value)  banksFetchRequested,required TResult Function( CreatePoolCategoriesFetchRequested value)  categoriesFetchRequested,required TResult Function( CreatePoolAccountLookupRequested value)  accountLookupRequested,required TResult Function( CreatePoolAccountLookupCleared value)  accountLookupCleared,required TResult Function( CreatePoolSubmitRequested value)  submitRequested,required TResult Function( CreatePoolSubmitStateCleared value)  submitStateCleared,}){
final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested():
return banksFetchRequested(_that);case CreatePoolCategoriesFetchRequested():
return categoriesFetchRequested(_that);case CreatePoolAccountLookupRequested():
return accountLookupRequested(_that);case CreatePoolAccountLookupCleared():
return accountLookupCleared(_that);case CreatePoolSubmitRequested():
return submitRequested(_that);case CreatePoolSubmitStateCleared():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePoolBanksFetchRequested value)?  banksFetchRequested,TResult? Function( CreatePoolCategoriesFetchRequested value)?  categoriesFetchRequested,TResult? Function( CreatePoolAccountLookupRequested value)?  accountLookupRequested,TResult? Function( CreatePoolAccountLookupCleared value)?  accountLookupCleared,TResult? Function( CreatePoolSubmitRequested value)?  submitRequested,TResult? Function( CreatePoolSubmitStateCleared value)?  submitStateCleared,}){
final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested(_that);case CreatePoolCategoriesFetchRequested() when categoriesFetchRequested != null:
return categoriesFetchRequested(_that);case CreatePoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that);case CreatePoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared(_that);case CreatePoolSubmitRequested() when submitRequested != null:
return submitRequested(_that);case CreatePoolSubmitStateCleared() when submitStateCleared != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  banksFetchRequested,TResult Function()?  categoriesFetchRequested,TResult Function( String accountNumber,  String bankCode)?  accountLookupRequested,TResult Function()?  accountLookupCleared,TResult Function( CreatePoolRequest request)?  submitRequested,TResult Function()?  submitStateCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested();case CreatePoolCategoriesFetchRequested() when categoriesFetchRequested != null:
return categoriesFetchRequested();case CreatePoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that.accountNumber,_that.bankCode);case CreatePoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared();case CreatePoolSubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case CreatePoolSubmitStateCleared() when submitStateCleared != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  banksFetchRequested,required TResult Function()  categoriesFetchRequested,required TResult Function( String accountNumber,  String bankCode)  accountLookupRequested,required TResult Function()  accountLookupCleared,required TResult Function( CreatePoolRequest request)  submitRequested,required TResult Function()  submitStateCleared,}) {final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested():
return banksFetchRequested();case CreatePoolCategoriesFetchRequested():
return categoriesFetchRequested();case CreatePoolAccountLookupRequested():
return accountLookupRequested(_that.accountNumber,_that.bankCode);case CreatePoolAccountLookupCleared():
return accountLookupCleared();case CreatePoolSubmitRequested():
return submitRequested(_that.request);case CreatePoolSubmitStateCleared():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  banksFetchRequested,TResult? Function()?  categoriesFetchRequested,TResult? Function( String accountNumber,  String bankCode)?  accountLookupRequested,TResult? Function()?  accountLookupCleared,TResult? Function( CreatePoolRequest request)?  submitRequested,TResult? Function()?  submitStateCleared,}) {final _that = this;
switch (_that) {
case CreatePoolBanksFetchRequested() when banksFetchRequested != null:
return banksFetchRequested();case CreatePoolCategoriesFetchRequested() when categoriesFetchRequested != null:
return categoriesFetchRequested();case CreatePoolAccountLookupRequested() when accountLookupRequested != null:
return accountLookupRequested(_that.accountNumber,_that.bankCode);case CreatePoolAccountLookupCleared() when accountLookupCleared != null:
return accountLookupCleared();case CreatePoolSubmitRequested() when submitRequested != null:
return submitRequested(_that.request);case CreatePoolSubmitStateCleared() when submitStateCleared != null:
return submitStateCleared();case _:
  return null;

}
}

}

/// @nodoc


class CreatePoolBanksFetchRequested implements CreatePoolEvent {
  const CreatePoolBanksFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolBanksFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolEvent.banksFetchRequested()';
}


}




/// @nodoc


class CreatePoolCategoriesFetchRequested implements CreatePoolEvent {
  const CreatePoolCategoriesFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolCategoriesFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolEvent.categoriesFetchRequested()';
}


}




/// @nodoc


class CreatePoolAccountLookupRequested implements CreatePoolEvent {
  const CreatePoolAccountLookupRequested({required this.accountNumber, required this.bankCode});
  

 final  String accountNumber;
 final  String bankCode;

/// Create a copy of CreatePoolEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolAccountLookupRequestedCopyWith<CreatePoolAccountLookupRequested> get copyWith => _$CreatePoolAccountLookupRequestedCopyWithImpl<CreatePoolAccountLookupRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolAccountLookupRequested&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode));
}


@override
int get hashCode => Object.hash(runtimeType,accountNumber,bankCode);

@override
String toString() {
  return 'CreatePoolEvent.accountLookupRequested(accountNumber: $accountNumber, bankCode: $bankCode)';
}


}

/// @nodoc
abstract mixin class $CreatePoolAccountLookupRequestedCopyWith<$Res> implements $CreatePoolEventCopyWith<$Res> {
  factory $CreatePoolAccountLookupRequestedCopyWith(CreatePoolAccountLookupRequested value, $Res Function(CreatePoolAccountLookupRequested) _then) = _$CreatePoolAccountLookupRequestedCopyWithImpl;
@useResult
$Res call({
 String accountNumber, String bankCode
});




}
/// @nodoc
class _$CreatePoolAccountLookupRequestedCopyWithImpl<$Res>
    implements $CreatePoolAccountLookupRequestedCopyWith<$Res> {
  _$CreatePoolAccountLookupRequestedCopyWithImpl(this._self, this._then);

  final CreatePoolAccountLookupRequested _self;
  final $Res Function(CreatePoolAccountLookupRequested) _then;

/// Create a copy of CreatePoolEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountNumber = null,Object? bankCode = null,}) {
  return _then(CreatePoolAccountLookupRequested(
accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolAccountLookupCleared implements CreatePoolEvent {
  const CreatePoolAccountLookupCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolAccountLookupCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolEvent.accountLookupCleared()';
}


}




/// @nodoc


class CreatePoolSubmitRequested implements CreatePoolEvent {
  const CreatePoolSubmitRequested(this.request);
  

 final  CreatePoolRequest request;

/// Create a copy of CreatePoolEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolSubmitRequestedCopyWith<CreatePoolSubmitRequested> get copyWith => _$CreatePoolSubmitRequestedCopyWithImpl<CreatePoolSubmitRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolSubmitRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'CreatePoolEvent.submitRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class $CreatePoolSubmitRequestedCopyWith<$Res> implements $CreatePoolEventCopyWith<$Res> {
  factory $CreatePoolSubmitRequestedCopyWith(CreatePoolSubmitRequested value, $Res Function(CreatePoolSubmitRequested) _then) = _$CreatePoolSubmitRequestedCopyWithImpl;
@useResult
$Res call({
 CreatePoolRequest request
});




}
/// @nodoc
class _$CreatePoolSubmitRequestedCopyWithImpl<$Res>
    implements $CreatePoolSubmitRequestedCopyWith<$Res> {
  _$CreatePoolSubmitRequestedCopyWithImpl(this._self, this._then);

  final CreatePoolSubmitRequested _self;
  final $Res Function(CreatePoolSubmitRequested) _then;

/// Create a copy of CreatePoolEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(CreatePoolSubmitRequested(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreatePoolRequest,
  ));
}


}

/// @nodoc


class CreatePoolSubmitStateCleared implements CreatePoolEvent {
  const CreatePoolSubmitStateCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolSubmitStateCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolEvent.submitStateCleared()';
}


}




/// @nodoc
mixin _$CreatePoolState {

 CreatePoolRequestStatus get banksStatus;/// The in-memory bank cache — once loaded, fetch events are no-ops.
 List<Bank> get banks; String? get banksError; CreatePoolRequestStatus get categoriesStatus;/// The in-memory category cache — once loaded, fetch events are no-ops.
 List<PoolCategory> get categories; String? get categoriesError; CreatePoolRequestStatus get accountLookupStatus;/// The account resolved by the last name enquiry, cleared when a new
/// lookup starts so a stale name is never shown against fresh input.
 BankAccount? get resolvedAccount; String? get accountLookupError; CreatePoolRequestStatus get createPoolStatus; String? get createPoolError;
/// Create a copy of CreatePoolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolStateCopyWith<CreatePoolState> get copyWith => _$CreatePoolStateCopyWithImpl<CreatePoolState>(this as CreatePoolState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolState&&(identical(other.banksStatus, banksStatus) || other.banksStatus == banksStatus)&&const DeepCollectionEquality().equals(other.banks, banks)&&(identical(other.banksError, banksError) || other.banksError == banksError)&&(identical(other.categoriesStatus, categoriesStatus) || other.categoriesStatus == categoriesStatus)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.categoriesError, categoriesError) || other.categoriesError == categoriesError)&&(identical(other.accountLookupStatus, accountLookupStatus) || other.accountLookupStatus == accountLookupStatus)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount)&&(identical(other.accountLookupError, accountLookupError) || other.accountLookupError == accountLookupError)&&(identical(other.createPoolStatus, createPoolStatus) || other.createPoolStatus == createPoolStatus)&&(identical(other.createPoolError, createPoolError) || other.createPoolError == createPoolError));
}


@override
int get hashCode => Object.hash(runtimeType,banksStatus,const DeepCollectionEquality().hash(banks),banksError,categoriesStatus,const DeepCollectionEquality().hash(categories),categoriesError,accountLookupStatus,resolvedAccount,accountLookupError,createPoolStatus,createPoolError);

@override
String toString() {
  return 'CreatePoolState(banksStatus: $banksStatus, banks: $banks, banksError: $banksError, categoriesStatus: $categoriesStatus, categories: $categories, categoriesError: $categoriesError, accountLookupStatus: $accountLookupStatus, resolvedAccount: $resolvedAccount, accountLookupError: $accountLookupError, createPoolStatus: $createPoolStatus, createPoolError: $createPoolError)';
}


}

/// @nodoc
abstract mixin class $CreatePoolStateCopyWith<$Res>  {
  factory $CreatePoolStateCopyWith(CreatePoolState value, $Res Function(CreatePoolState) _then) = _$CreatePoolStateCopyWithImpl;
@useResult
$Res call({
 CreatePoolRequestStatus banksStatus, List<Bank> banks, String? banksError, CreatePoolRequestStatus categoriesStatus, List<PoolCategory> categories, String? categoriesError, CreatePoolRequestStatus accountLookupStatus, BankAccount? resolvedAccount, String? accountLookupError, CreatePoolRequestStatus createPoolStatus, String? createPoolError
});




}
/// @nodoc
class _$CreatePoolStateCopyWithImpl<$Res>
    implements $CreatePoolStateCopyWith<$Res> {
  _$CreatePoolStateCopyWithImpl(this._self, this._then);

  final CreatePoolState _self;
  final $Res Function(CreatePoolState) _then;

/// Create a copy of CreatePoolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banksStatus = null,Object? banks = null,Object? banksError = freezed,Object? categoriesStatus = null,Object? categories = null,Object? categoriesError = freezed,Object? accountLookupStatus = null,Object? resolvedAccount = freezed,Object? accountLookupError = freezed,Object? createPoolStatus = null,Object? createPoolError = freezed,}) {
  return _then(CreatePoolState(
banksStatus: null == banksStatus ? _self.banksStatus : banksStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,banks: null == banks ? _self.banks : banks // ignore: cast_nullable_to_non_nullable
as List<Bank>,banksError: freezed == banksError ? _self.banksError : banksError // ignore: cast_nullable_to_non_nullable
as String?,categoriesStatus: null == categoriesStatus ? _self.categoriesStatus : categoriesStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<PoolCategory>,categoriesError: freezed == categoriesError ? _self.categoriesError : categoriesError // ignore: cast_nullable_to_non_nullable
as String?,accountLookupStatus: null == accountLookupStatus ? _self.accountLookupStatus : accountLookupStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,accountLookupError: freezed == accountLookupError ? _self.accountLookupError : accountLookupError // ignore: cast_nullable_to_non_nullable
as String?,createPoolStatus: null == createPoolStatus ? _self.createPoolStatus : createPoolStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,createPoolError: freezed == createPoolError ? _self.createPoolError : createPoolError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePoolState].
extension CreatePoolStatePatterns on CreatePoolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePoolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePoolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePoolState value)  $default,){
final _that = this;
switch (_that) {
case _CreatePoolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePoolState value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePoolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreatePoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  CreatePoolRequestStatus categoriesStatus,  List<PoolCategory> categories,  String? categoriesError,  CreatePoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  CreatePoolRequestStatus createPoolStatus,  String? createPoolError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePoolState() when $default != null:
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.categoriesStatus,_that.categories,_that.categoriesError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.createPoolStatus,_that.createPoolError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreatePoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  CreatePoolRequestStatus categoriesStatus,  List<PoolCategory> categories,  String? categoriesError,  CreatePoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  CreatePoolRequestStatus createPoolStatus,  String? createPoolError)  $default,) {final _that = this;
switch (_that) {
case _CreatePoolState():
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.categoriesStatus,_that.categories,_that.categoriesError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.createPoolStatus,_that.createPoolError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreatePoolRequestStatus banksStatus,  List<Bank> banks,  String? banksError,  CreatePoolRequestStatus categoriesStatus,  List<PoolCategory> categories,  String? categoriesError,  CreatePoolRequestStatus accountLookupStatus,  BankAccount? resolvedAccount,  String? accountLookupError,  CreatePoolRequestStatus createPoolStatus,  String? createPoolError)?  $default,) {final _that = this;
switch (_that) {
case _CreatePoolState() when $default != null:
return $default(_that.banksStatus,_that.banks,_that.banksError,_that.categoriesStatus,_that.categories,_that.categoriesError,_that.accountLookupStatus,_that.resolvedAccount,_that.accountLookupError,_that.createPoolStatus,_that.createPoolError);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePoolState extends CreatePoolState {
  const _CreatePoolState({this.banksStatus = CreatePoolRequestStatus.initial,  List<Bank> banks = const <Bank>[], this.banksError, this.categoriesStatus = CreatePoolRequestStatus.initial,  List<PoolCategory> categories = const <PoolCategory>[], this.categoriesError, this.accountLookupStatus = CreatePoolRequestStatus.initial, this.resolvedAccount, this.accountLookupError, this.createPoolStatus = CreatePoolRequestStatus.initial, this.createPoolError}): _banks = banks,_categories = categories,super._();
  

@override@JsonKey() final  CreatePoolRequestStatus banksStatus;
/// The in-memory bank cache — once loaded, fetch events are no-ops.
 final  List<Bank> _banks;
/// The in-memory bank cache — once loaded, fetch events are no-ops.
@override@JsonKey() List<Bank> get banks {
  if (_banks is EqualUnmodifiableListView) return _banks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banks);
}

@override final  String? banksError;
@override@JsonKey() final  CreatePoolRequestStatus categoriesStatus;
/// The in-memory category cache — once loaded, fetch events are no-ops.
 final  List<PoolCategory> _categories;
/// The in-memory category cache — once loaded, fetch events are no-ops.
@override@JsonKey() List<PoolCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String? categoriesError;
@override@JsonKey() final  CreatePoolRequestStatus accountLookupStatus;
/// The account resolved by the last name enquiry, cleared when a new
/// lookup starts so a stale name is never shown against fresh input.
@override final  BankAccount? resolvedAccount;
@override final  String? accountLookupError;
@override@JsonKey() final  CreatePoolRequestStatus createPoolStatus;
@override final  String? createPoolError;

/// Create a copy of CreatePoolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePoolStateCopyWith<_CreatePoolState> get copyWith => __$CreatePoolStateCopyWithImpl<_CreatePoolState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePoolState&&(identical(other.banksStatus, banksStatus) || other.banksStatus == banksStatus)&&const DeepCollectionEquality().equals(other._banks, _banks)&&(identical(other.banksError, banksError) || other.banksError == banksError)&&(identical(other.categoriesStatus, categoriesStatus) || other.categoriesStatus == categoriesStatus)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.categoriesError, categoriesError) || other.categoriesError == categoriesError)&&(identical(other.accountLookupStatus, accountLookupStatus) || other.accountLookupStatus == accountLookupStatus)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount)&&(identical(other.accountLookupError, accountLookupError) || other.accountLookupError == accountLookupError)&&(identical(other.createPoolStatus, createPoolStatus) || other.createPoolStatus == createPoolStatus)&&(identical(other.createPoolError, createPoolError) || other.createPoolError == createPoolError));
}


@override
int get hashCode => Object.hash(runtimeType,banksStatus,const DeepCollectionEquality().hash(_banks),banksError,categoriesStatus,const DeepCollectionEquality().hash(_categories),categoriesError,accountLookupStatus,resolvedAccount,accountLookupError,createPoolStatus,createPoolError);

@override
String toString() {
  return 'CreatePoolState(banksStatus: $banksStatus, banks: $banks, banksError: $banksError, categoriesStatus: $categoriesStatus, categories: $categories, categoriesError: $categoriesError, accountLookupStatus: $accountLookupStatus, resolvedAccount: $resolvedAccount, accountLookupError: $accountLookupError, createPoolStatus: $createPoolStatus, createPoolError: $createPoolError)';
}


}

/// @nodoc
abstract mixin class _$CreatePoolStateCopyWith<$Res> implements $CreatePoolStateCopyWith<$Res> {
  factory _$CreatePoolStateCopyWith(_CreatePoolState value, $Res Function(_CreatePoolState) _then) = __$CreatePoolStateCopyWithImpl;
@override @useResult
$Res call({
 CreatePoolRequestStatus banksStatus, List<Bank> banks, String? banksError, CreatePoolRequestStatus categoriesStatus, List<PoolCategory> categories, String? categoriesError, CreatePoolRequestStatus accountLookupStatus, BankAccount? resolvedAccount, String? accountLookupError, CreatePoolRequestStatus createPoolStatus, String? createPoolError
});




}
/// @nodoc
class __$CreatePoolStateCopyWithImpl<$Res>
    implements _$CreatePoolStateCopyWith<$Res> {
  __$CreatePoolStateCopyWithImpl(this._self, this._then);

  final _CreatePoolState _self;
  final $Res Function(_CreatePoolState) _then;

/// Create a copy of CreatePoolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banksStatus = null,Object? banks = null,Object? banksError = freezed,Object? categoriesStatus = null,Object? categories = null,Object? categoriesError = freezed,Object? accountLookupStatus = null,Object? resolvedAccount = freezed,Object? accountLookupError = freezed,Object? createPoolStatus = null,Object? createPoolError = freezed,}) {
  return _then(_CreatePoolState(
banksStatus: null == banksStatus ? _self.banksStatus : banksStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,banks: null == banks ? _self._banks : banks // ignore: cast_nullable_to_non_nullable
as List<Bank>,banksError: freezed == banksError ? _self.banksError : banksError // ignore: cast_nullable_to_non_nullable
as String?,categoriesStatus: null == categoriesStatus ? _self.categoriesStatus : categoriesStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<PoolCategory>,categoriesError: freezed == categoriesError ? _self.categoriesError : categoriesError // ignore: cast_nullable_to_non_nullable
as String?,accountLookupStatus: null == accountLookupStatus ? _self.accountLookupStatus : accountLookupStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,accountLookupError: freezed == accountLookupError ? _self.accountLookupError : accountLookupError // ignore: cast_nullable_to_non_nullable
as String?,createPoolStatus: null == createPoolStatus ? _self.createPoolStatus : createPoolStatus // ignore: cast_nullable_to_non_nullable
as CreatePoolRequestStatus,createPoolError: freezed == createPoolError ? _self.createPoolError : createPoolError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
