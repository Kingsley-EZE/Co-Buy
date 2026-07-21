// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_pool_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePoolFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreatePoolFormEvent()';
}


}

/// @nodoc
class $CreatePoolFormEventCopyWith<$Res>  {
$CreatePoolFormEventCopyWith(CreatePoolFormEvent _, $Res Function(CreatePoolFormEvent) __);
}


/// Adds pattern-matching-related methods to [CreatePoolFormEvent].
extension CreatePoolFormEventPatterns on CreatePoolFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePoolTitleChanged value)?  titleChanged,TResult Function( CreatePoolDescriptionChanged value)?  descriptionChanged,TResult Function( CreatePoolCategoryChanged value)?  categoryChanged,TResult Function( CreatePoolTargetAmountChanged value)?  targetAmountChanged,TResult Function( CreatePoolSlotsChanged value)?  slotsChanged,TResult Function( CreatePoolDeadlineChanged value)?  deadlineChanged,TResult Function( CreatePoolBankChanged value)?  bankChanged,TResult Function( CreatePoolAccountNumberChanged value)?  accountNumberChanged,TResult Function( CreatePoolAccountLookupResultChanged value)?  accountLookupResultChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePoolTitleChanged() when titleChanged != null:
return titleChanged(_that);case CreatePoolDescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case CreatePoolCategoryChanged() when categoryChanged != null:
return categoryChanged(_that);case CreatePoolTargetAmountChanged() when targetAmountChanged != null:
return targetAmountChanged(_that);case CreatePoolSlotsChanged() when slotsChanged != null:
return slotsChanged(_that);case CreatePoolDeadlineChanged() when deadlineChanged != null:
return deadlineChanged(_that);case CreatePoolBankChanged() when bankChanged != null:
return bankChanged(_that);case CreatePoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that);case CreatePoolAccountLookupResultChanged() when accountLookupResultChanged != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePoolTitleChanged value)  titleChanged,required TResult Function( CreatePoolDescriptionChanged value)  descriptionChanged,required TResult Function( CreatePoolCategoryChanged value)  categoryChanged,required TResult Function( CreatePoolTargetAmountChanged value)  targetAmountChanged,required TResult Function( CreatePoolSlotsChanged value)  slotsChanged,required TResult Function( CreatePoolDeadlineChanged value)  deadlineChanged,required TResult Function( CreatePoolBankChanged value)  bankChanged,required TResult Function( CreatePoolAccountNumberChanged value)  accountNumberChanged,required TResult Function( CreatePoolAccountLookupResultChanged value)  accountLookupResultChanged,}){
final _that = this;
switch (_that) {
case CreatePoolTitleChanged():
return titleChanged(_that);case CreatePoolDescriptionChanged():
return descriptionChanged(_that);case CreatePoolCategoryChanged():
return categoryChanged(_that);case CreatePoolTargetAmountChanged():
return targetAmountChanged(_that);case CreatePoolSlotsChanged():
return slotsChanged(_that);case CreatePoolDeadlineChanged():
return deadlineChanged(_that);case CreatePoolBankChanged():
return bankChanged(_that);case CreatePoolAccountNumberChanged():
return accountNumberChanged(_that);case CreatePoolAccountLookupResultChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePoolTitleChanged value)?  titleChanged,TResult? Function( CreatePoolDescriptionChanged value)?  descriptionChanged,TResult? Function( CreatePoolCategoryChanged value)?  categoryChanged,TResult? Function( CreatePoolTargetAmountChanged value)?  targetAmountChanged,TResult? Function( CreatePoolSlotsChanged value)?  slotsChanged,TResult? Function( CreatePoolDeadlineChanged value)?  deadlineChanged,TResult? Function( CreatePoolBankChanged value)?  bankChanged,TResult? Function( CreatePoolAccountNumberChanged value)?  accountNumberChanged,TResult? Function( CreatePoolAccountLookupResultChanged value)?  accountLookupResultChanged,}){
final _that = this;
switch (_that) {
case CreatePoolTitleChanged() when titleChanged != null:
return titleChanged(_that);case CreatePoolDescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case CreatePoolCategoryChanged() when categoryChanged != null:
return categoryChanged(_that);case CreatePoolTargetAmountChanged() when targetAmountChanged != null:
return targetAmountChanged(_that);case CreatePoolSlotsChanged() when slotsChanged != null:
return slotsChanged(_that);case CreatePoolDeadlineChanged() when deadlineChanged != null:
return deadlineChanged(_that);case CreatePoolBankChanged() when bankChanged != null:
return bankChanged(_that);case CreatePoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that);case CreatePoolAccountLookupResultChanged() when accountLookupResultChanged != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title)?  titleChanged,TResult Function( String description)?  descriptionChanged,TResult Function( PoolCategory category)?  categoryChanged,TResult Function( String amount)?  targetAmountChanged,TResult Function( String slots)?  slotsChanged,TResult Function( DateTime deadline)?  deadlineChanged,TResult Function( Bank bank)?  bankChanged,TResult Function( String accountNumber)?  accountNumberChanged,TResult Function( BankAccount? account)?  accountLookupResultChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePoolTitleChanged() when titleChanged != null:
return titleChanged(_that.title);case CreatePoolDescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case CreatePoolCategoryChanged() when categoryChanged != null:
return categoryChanged(_that.category);case CreatePoolTargetAmountChanged() when targetAmountChanged != null:
return targetAmountChanged(_that.amount);case CreatePoolSlotsChanged() when slotsChanged != null:
return slotsChanged(_that.slots);case CreatePoolDeadlineChanged() when deadlineChanged != null:
return deadlineChanged(_that.deadline);case CreatePoolBankChanged() when bankChanged != null:
return bankChanged(_that.bank);case CreatePoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that.accountNumber);case CreatePoolAccountLookupResultChanged() when accountLookupResultChanged != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title)  titleChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( PoolCategory category)  categoryChanged,required TResult Function( String amount)  targetAmountChanged,required TResult Function( String slots)  slotsChanged,required TResult Function( DateTime deadline)  deadlineChanged,required TResult Function( Bank bank)  bankChanged,required TResult Function( String accountNumber)  accountNumberChanged,required TResult Function( BankAccount? account)  accountLookupResultChanged,}) {final _that = this;
switch (_that) {
case CreatePoolTitleChanged():
return titleChanged(_that.title);case CreatePoolDescriptionChanged():
return descriptionChanged(_that.description);case CreatePoolCategoryChanged():
return categoryChanged(_that.category);case CreatePoolTargetAmountChanged():
return targetAmountChanged(_that.amount);case CreatePoolSlotsChanged():
return slotsChanged(_that.slots);case CreatePoolDeadlineChanged():
return deadlineChanged(_that.deadline);case CreatePoolBankChanged():
return bankChanged(_that.bank);case CreatePoolAccountNumberChanged():
return accountNumberChanged(_that.accountNumber);case CreatePoolAccountLookupResultChanged():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title)?  titleChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( PoolCategory category)?  categoryChanged,TResult? Function( String amount)?  targetAmountChanged,TResult? Function( String slots)?  slotsChanged,TResult? Function( DateTime deadline)?  deadlineChanged,TResult? Function( Bank bank)?  bankChanged,TResult? Function( String accountNumber)?  accountNumberChanged,TResult? Function( BankAccount? account)?  accountLookupResultChanged,}) {final _that = this;
switch (_that) {
case CreatePoolTitleChanged() when titleChanged != null:
return titleChanged(_that.title);case CreatePoolDescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case CreatePoolCategoryChanged() when categoryChanged != null:
return categoryChanged(_that.category);case CreatePoolTargetAmountChanged() when targetAmountChanged != null:
return targetAmountChanged(_that.amount);case CreatePoolSlotsChanged() when slotsChanged != null:
return slotsChanged(_that.slots);case CreatePoolDeadlineChanged() when deadlineChanged != null:
return deadlineChanged(_that.deadline);case CreatePoolBankChanged() when bankChanged != null:
return bankChanged(_that.bank);case CreatePoolAccountNumberChanged() when accountNumberChanged != null:
return accountNumberChanged(_that.accountNumber);case CreatePoolAccountLookupResultChanged() when accountLookupResultChanged != null:
return accountLookupResultChanged(_that.account);case _:
  return null;

}
}

}

/// @nodoc


class CreatePoolTitleChanged implements CreatePoolFormEvent {
  const CreatePoolTitleChanged(this.title);
  

 final  String title;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolTitleChangedCopyWith<CreatePoolTitleChanged> get copyWith => _$CreatePoolTitleChangedCopyWithImpl<CreatePoolTitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolTitleChanged&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'CreatePoolFormEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class $CreatePoolTitleChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolTitleChangedCopyWith(CreatePoolTitleChanged value, $Res Function(CreatePoolTitleChanged) _then) = _$CreatePoolTitleChangedCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$CreatePoolTitleChangedCopyWithImpl<$Res>
    implements $CreatePoolTitleChangedCopyWith<$Res> {
  _$CreatePoolTitleChangedCopyWithImpl(this._self, this._then);

  final CreatePoolTitleChanged _self;
  final $Res Function(CreatePoolTitleChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(CreatePoolTitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolDescriptionChanged implements CreatePoolFormEvent {
  const CreatePoolDescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolDescriptionChangedCopyWith<CreatePoolDescriptionChanged> get copyWith => _$CreatePoolDescriptionChangedCopyWithImpl<CreatePoolDescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolDescriptionChanged&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'CreatePoolFormEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class $CreatePoolDescriptionChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolDescriptionChangedCopyWith(CreatePoolDescriptionChanged value, $Res Function(CreatePoolDescriptionChanged) _then) = _$CreatePoolDescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$CreatePoolDescriptionChangedCopyWithImpl<$Res>
    implements $CreatePoolDescriptionChangedCopyWith<$Res> {
  _$CreatePoolDescriptionChangedCopyWithImpl(this._self, this._then);

  final CreatePoolDescriptionChanged _self;
  final $Res Function(CreatePoolDescriptionChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(CreatePoolDescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolCategoryChanged implements CreatePoolFormEvent {
  const CreatePoolCategoryChanged(this.category);
  

 final  PoolCategory category;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolCategoryChangedCopyWith<CreatePoolCategoryChanged> get copyWith => _$CreatePoolCategoryChangedCopyWithImpl<CreatePoolCategoryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolCategoryChanged&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CreatePoolFormEvent.categoryChanged(category: $category)';
}


}

/// @nodoc
abstract mixin class $CreatePoolCategoryChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolCategoryChangedCopyWith(CreatePoolCategoryChanged value, $Res Function(CreatePoolCategoryChanged) _then) = _$CreatePoolCategoryChangedCopyWithImpl;
@useResult
$Res call({
 PoolCategory category
});




}
/// @nodoc
class _$CreatePoolCategoryChangedCopyWithImpl<$Res>
    implements $CreatePoolCategoryChangedCopyWith<$Res> {
  _$CreatePoolCategoryChangedCopyWithImpl(this._self, this._then);

  final CreatePoolCategoryChanged _self;
  final $Res Function(CreatePoolCategoryChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(CreatePoolCategoryChanged(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PoolCategory,
  ));
}


}

/// @nodoc


class CreatePoolTargetAmountChanged implements CreatePoolFormEvent {
  const CreatePoolTargetAmountChanged(this.amount);
  

 final  String amount;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolTargetAmountChangedCopyWith<CreatePoolTargetAmountChanged> get copyWith => _$CreatePoolTargetAmountChangedCopyWithImpl<CreatePoolTargetAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolTargetAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'CreatePoolFormEvent.targetAmountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $CreatePoolTargetAmountChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolTargetAmountChangedCopyWith(CreatePoolTargetAmountChanged value, $Res Function(CreatePoolTargetAmountChanged) _then) = _$CreatePoolTargetAmountChangedCopyWithImpl;
@useResult
$Res call({
 String amount
});




}
/// @nodoc
class _$CreatePoolTargetAmountChangedCopyWithImpl<$Res>
    implements $CreatePoolTargetAmountChangedCopyWith<$Res> {
  _$CreatePoolTargetAmountChangedCopyWithImpl(this._self, this._then);

  final CreatePoolTargetAmountChanged _self;
  final $Res Function(CreatePoolTargetAmountChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(CreatePoolTargetAmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolSlotsChanged implements CreatePoolFormEvent {
  const CreatePoolSlotsChanged(this.slots);
  

 final  String slots;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolSlotsChangedCopyWith<CreatePoolSlotsChanged> get copyWith => _$CreatePoolSlotsChangedCopyWithImpl<CreatePoolSlotsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolSlotsChanged&&(identical(other.slots, slots) || other.slots == slots));
}


@override
int get hashCode => Object.hash(runtimeType,slots);

@override
String toString() {
  return 'CreatePoolFormEvent.slotsChanged(slots: $slots)';
}


}

/// @nodoc
abstract mixin class $CreatePoolSlotsChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolSlotsChangedCopyWith(CreatePoolSlotsChanged value, $Res Function(CreatePoolSlotsChanged) _then) = _$CreatePoolSlotsChangedCopyWithImpl;
@useResult
$Res call({
 String slots
});




}
/// @nodoc
class _$CreatePoolSlotsChangedCopyWithImpl<$Res>
    implements $CreatePoolSlotsChangedCopyWith<$Res> {
  _$CreatePoolSlotsChangedCopyWithImpl(this._self, this._then);

  final CreatePoolSlotsChanged _self;
  final $Res Function(CreatePoolSlotsChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slots = null,}) {
  return _then(CreatePoolSlotsChanged(
null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolDeadlineChanged implements CreatePoolFormEvent {
  const CreatePoolDeadlineChanged(this.deadline);
  

 final  DateTime deadline;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolDeadlineChangedCopyWith<CreatePoolDeadlineChanged> get copyWith => _$CreatePoolDeadlineChangedCopyWithImpl<CreatePoolDeadlineChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolDeadlineChanged&&(identical(other.deadline, deadline) || other.deadline == deadline));
}


@override
int get hashCode => Object.hash(runtimeType,deadline);

@override
String toString() {
  return 'CreatePoolFormEvent.deadlineChanged(deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class $CreatePoolDeadlineChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolDeadlineChangedCopyWith(CreatePoolDeadlineChanged value, $Res Function(CreatePoolDeadlineChanged) _then) = _$CreatePoolDeadlineChangedCopyWithImpl;
@useResult
$Res call({
 DateTime deadline
});




}
/// @nodoc
class _$CreatePoolDeadlineChangedCopyWithImpl<$Res>
    implements $CreatePoolDeadlineChangedCopyWith<$Res> {
  _$CreatePoolDeadlineChangedCopyWithImpl(this._self, this._then);

  final CreatePoolDeadlineChanged _self;
  final $Res Function(CreatePoolDeadlineChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deadline = null,}) {
  return _then(CreatePoolDeadlineChanged(
null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class CreatePoolBankChanged implements CreatePoolFormEvent {
  const CreatePoolBankChanged(this.bank);
  

 final  Bank bank;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolBankChangedCopyWith<CreatePoolBankChanged> get copyWith => _$CreatePoolBankChangedCopyWithImpl<CreatePoolBankChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolBankChanged&&(identical(other.bank, bank) || other.bank == bank));
}


@override
int get hashCode => Object.hash(runtimeType,bank);

@override
String toString() {
  return 'CreatePoolFormEvent.bankChanged(bank: $bank)';
}


}

/// @nodoc
abstract mixin class $CreatePoolBankChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolBankChangedCopyWith(CreatePoolBankChanged value, $Res Function(CreatePoolBankChanged) _then) = _$CreatePoolBankChangedCopyWithImpl;
@useResult
$Res call({
 Bank bank
});




}
/// @nodoc
class _$CreatePoolBankChangedCopyWithImpl<$Res>
    implements $CreatePoolBankChangedCopyWith<$Res> {
  _$CreatePoolBankChangedCopyWithImpl(this._self, this._then);

  final CreatePoolBankChanged _self;
  final $Res Function(CreatePoolBankChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bank = null,}) {
  return _then(CreatePoolBankChanged(
null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank,
  ));
}


}

/// @nodoc


class CreatePoolAccountNumberChanged implements CreatePoolFormEvent {
  const CreatePoolAccountNumberChanged(this.accountNumber);
  

 final  String accountNumber;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolAccountNumberChangedCopyWith<CreatePoolAccountNumberChanged> get copyWith => _$CreatePoolAccountNumberChangedCopyWithImpl<CreatePoolAccountNumberChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolAccountNumberChanged&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}


@override
int get hashCode => Object.hash(runtimeType,accountNumber);

@override
String toString() {
  return 'CreatePoolFormEvent.accountNumberChanged(accountNumber: $accountNumber)';
}


}

/// @nodoc
abstract mixin class $CreatePoolAccountNumberChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolAccountNumberChangedCopyWith(CreatePoolAccountNumberChanged value, $Res Function(CreatePoolAccountNumberChanged) _then) = _$CreatePoolAccountNumberChangedCopyWithImpl;
@useResult
$Res call({
 String accountNumber
});




}
/// @nodoc
class _$CreatePoolAccountNumberChangedCopyWithImpl<$Res>
    implements $CreatePoolAccountNumberChangedCopyWith<$Res> {
  _$CreatePoolAccountNumberChangedCopyWithImpl(this._self, this._then);

  final CreatePoolAccountNumberChanged _self;
  final $Res Function(CreatePoolAccountNumberChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountNumber = null,}) {
  return _then(CreatePoolAccountNumberChanged(
null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreatePoolAccountLookupResultChanged implements CreatePoolFormEvent {
  const CreatePoolAccountLookupResultChanged(this.account);
  

 final  BankAccount? account;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolAccountLookupResultChangedCopyWith<CreatePoolAccountLookupResultChanged> get copyWith => _$CreatePoolAccountLookupResultChangedCopyWithImpl<CreatePoolAccountLookupResultChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolAccountLookupResultChanged&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'CreatePoolFormEvent.accountLookupResultChanged(account: $account)';
}


}

/// @nodoc
abstract mixin class $CreatePoolAccountLookupResultChangedCopyWith<$Res> implements $CreatePoolFormEventCopyWith<$Res> {
  factory $CreatePoolAccountLookupResultChangedCopyWith(CreatePoolAccountLookupResultChanged value, $Res Function(CreatePoolAccountLookupResultChanged) _then) = _$CreatePoolAccountLookupResultChangedCopyWithImpl;
@useResult
$Res call({
 BankAccount? account
});




}
/// @nodoc
class _$CreatePoolAccountLookupResultChangedCopyWithImpl<$Res>
    implements $CreatePoolAccountLookupResultChangedCopyWith<$Res> {
  _$CreatePoolAccountLookupResultChangedCopyWithImpl(this._self, this._then);

  final CreatePoolAccountLookupResultChanged _self;
  final $Res Function(CreatePoolAccountLookupResultChanged) _then;

/// Create a copy of CreatePoolFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = freezed,}) {
  return _then(CreatePoolAccountLookupResultChanged(
freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}


}

/// @nodoc
mixin _$CreatePoolFormState {

 String get title; String get description; PoolCategory? get category; bool get evenContribution; String get targetAmount; String get slots; DateTime? get deadline; Bank? get bank; String get accountNumber;/// Mirrored from [CreatePoolBloc] by the page for [canSubmit].
 BankAccount? get resolvedAccount;
/// Create a copy of CreatePoolFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePoolFormStateCopyWith<CreatePoolFormState> get copyWith => _$CreatePoolFormStateCopyWithImpl<CreatePoolFormState>(this as CreatePoolFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePoolFormState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.evenContribution, evenContribution) || other.evenContribution == evenContribution)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.slots, slots) || other.slots == slots)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,category,evenContribution,targetAmount,slots,deadline,bank,accountNumber,resolvedAccount);

@override
String toString() {
  return 'CreatePoolFormState(title: $title, description: $description, category: $category, evenContribution: $evenContribution, targetAmount: $targetAmount, slots: $slots, deadline: $deadline, bank: $bank, accountNumber: $accountNumber, resolvedAccount: $resolvedAccount)';
}


}

/// @nodoc
abstract mixin class $CreatePoolFormStateCopyWith<$Res>  {
  factory $CreatePoolFormStateCopyWith(CreatePoolFormState value, $Res Function(CreatePoolFormState) _then) = _$CreatePoolFormStateCopyWithImpl;
@useResult
$Res call({
 String title, String description, PoolCategory? category, bool evenContribution, String targetAmount, String slots, DateTime? deadline, Bank? bank, String accountNumber, BankAccount? resolvedAccount
});




}
/// @nodoc
class _$CreatePoolFormStateCopyWithImpl<$Res>
    implements $CreatePoolFormStateCopyWith<$Res> {
  _$CreatePoolFormStateCopyWithImpl(this._self, this._then);

  final CreatePoolFormState _self;
  final $Res Function(CreatePoolFormState) _then;

/// Create a copy of CreatePoolFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? category = freezed,Object? evenContribution = null,Object? targetAmount = null,Object? slots = null,Object? deadline = freezed,Object? bank = freezed,Object? accountNumber = null,Object? resolvedAccount = freezed,}) {
  return _then(CreatePoolFormState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PoolCategory?,evenContribution: null == evenContribution ? _self.evenContribution : evenContribution // ignore: cast_nullable_to_non_nullable
as bool,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as String,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePoolFormState].
extension CreatePoolFormStatePatterns on CreatePoolFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePoolFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePoolFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePoolFormState value)  $default,){
final _that = this;
switch (_that) {
case _CreatePoolFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePoolFormState value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePoolFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  PoolCategory? category,  bool evenContribution,  String targetAmount,  String slots,  DateTime? deadline,  Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePoolFormState() when $default != null:
return $default(_that.title,_that.description,_that.category,_that.evenContribution,_that.targetAmount,_that.slots,_that.deadline,_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  PoolCategory? category,  bool evenContribution,  String targetAmount,  String slots,  DateTime? deadline,  Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)  $default,) {final _that = this;
switch (_that) {
case _CreatePoolFormState():
return $default(_that.title,_that.description,_that.category,_that.evenContribution,_that.targetAmount,_that.slots,_that.deadline,_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  PoolCategory? category,  bool evenContribution,  String targetAmount,  String slots,  DateTime? deadline,  Bank? bank,  String accountNumber,  BankAccount? resolvedAccount)?  $default,) {final _that = this;
switch (_that) {
case _CreatePoolFormState() when $default != null:
return $default(_that.title,_that.description,_that.category,_that.evenContribution,_that.targetAmount,_that.slots,_that.deadline,_that.bank,_that.accountNumber,_that.resolvedAccount);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePoolFormState extends CreatePoolFormState {
  const _CreatePoolFormState({this.title = '', this.description = '', this.category, this.evenContribution = true, this.targetAmount = '', this.slots = '', this.deadline, this.bank, this.accountNumber = '', this.resolvedAccount}): super._();
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  PoolCategory? category;
@override@JsonKey() final  bool evenContribution;
@override@JsonKey() final  String targetAmount;
@override@JsonKey() final  String slots;
@override final  DateTime? deadline;
@override final  Bank? bank;
@override@JsonKey() final  String accountNumber;
/// Mirrored from [CreatePoolBloc] by the page for [canSubmit].
@override final  BankAccount? resolvedAccount;

/// Create a copy of CreatePoolFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePoolFormStateCopyWith<_CreatePoolFormState> get copyWith => __$CreatePoolFormStateCopyWithImpl<_CreatePoolFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePoolFormState&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.evenContribution, evenContribution) || other.evenContribution == evenContribution)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.slots, slots) || other.slots == slots)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.resolvedAccount, resolvedAccount) || other.resolvedAccount == resolvedAccount));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,category,evenContribution,targetAmount,slots,deadline,bank,accountNumber,resolvedAccount);

@override
String toString() {
  return 'CreatePoolFormState(title: $title, description: $description, category: $category, evenContribution: $evenContribution, targetAmount: $targetAmount, slots: $slots, deadline: $deadline, bank: $bank, accountNumber: $accountNumber, resolvedAccount: $resolvedAccount)';
}


}

/// @nodoc
abstract mixin class _$CreatePoolFormStateCopyWith<$Res> implements $CreatePoolFormStateCopyWith<$Res> {
  factory _$CreatePoolFormStateCopyWith(_CreatePoolFormState value, $Res Function(_CreatePoolFormState) _then) = __$CreatePoolFormStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, PoolCategory? category, bool evenContribution, String targetAmount, String slots, DateTime? deadline, Bank? bank, String accountNumber, BankAccount? resolvedAccount
});




}
/// @nodoc
class __$CreatePoolFormStateCopyWithImpl<$Res>
    implements _$CreatePoolFormStateCopyWith<$Res> {
  __$CreatePoolFormStateCopyWithImpl(this._self, this._then);

  final _CreatePoolFormState _self;
  final $Res Function(_CreatePoolFormState) _then;

/// Create a copy of CreatePoolFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? category = freezed,Object? evenContribution = null,Object? targetAmount = null,Object? slots = null,Object? deadline = freezed,Object? bank = freezed,Object? accountNumber = null,Object? resolvedAccount = freezed,}) {
  return _then(_CreatePoolFormState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PoolCategory?,evenContribution: null == evenContribution ? _self.evenContribution : evenContribution // ignore: cast_nullable_to_non_nullable
as bool,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as String,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as Bank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,resolvedAccount: freezed == resolvedAccount ? _self.resolvedAccount : resolvedAccount // ignore: cast_nullable_to_non_nullable
as BankAccount?,
  ));
}


}

// dart format on
