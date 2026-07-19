import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'join_pool_form_event.dart';
part 'join_pool_form_state.dart';
part 'join_pool_form_bloc.freezed.dart';

/// Owns the join-pool form's field values and validity so the page is a
/// pure renderer. The network calls (bank list, name enquiry, joining) live
/// with [JoinPoolBloc].
@injectable
class JoinPoolFormBloc extends Bloc<JoinPoolFormEvent, JoinPoolFormState> {
  JoinPoolFormBloc() : super(const JoinPoolFormState()) {
    on<JoinPoolBankChanged>(
      (event, emit) => emit(state.copyWith(bank: event.bank)),
    );
    on<JoinPoolAccountNumberChanged>(
      (event, emit) => emit(state.copyWith(accountNumber: event.accountNumber)),
    );
    on<JoinPoolAccountLookupResultChanged>(
      (event, emit) => emit(state.copyWith(resolvedAccount: event.account)),
    );
  }
}
