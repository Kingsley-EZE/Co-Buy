import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/entities/create_pool_request.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_pool_form_event.dart';
part 'create_pool_form_state.dart';
part 'create_pool_form_bloc.freezed.dart';

/// Owns the create-pool form's field values and validity so the page is a
/// pure renderer. Submission will live with the pools feature bloc once the
/// create-pool use case lands.
@injectable
class CreatePoolFormBloc
    extends Bloc<CreatePoolFormEvent, CreatePoolFormState> {
  CreatePoolFormBloc() : super(const CreatePoolFormState()) {
    on<CreatePoolTitleChanged>(
      (event, emit) => emit(state.copyWith(title: event.title)),
    );
    on<CreatePoolDescriptionChanged>(
      (event, emit) => emit(state.copyWith(description: event.description)),
    );
    on<CreatePoolCategoryChanged>(
      (event, emit) => emit(state.copyWith(category: event.category)),
    );
    on<CreatePoolEvenContributionChanged>(
      (event, emit) =>
          emit(state.copyWith(evenContribution: event.evenContribution)),
    );
    on<CreatePoolTargetAmountChanged>(
      (event, emit) => emit(state.copyWith(targetAmount: event.amount)),
    );
    on<CreatePoolSlotsChanged>(
      (event, emit) => emit(state.copyWith(slots: event.slots)),
    );
    on<CreatePoolDeadlineChanged>(
      (event, emit) => emit(state.copyWith(deadline: event.deadline)),
    );
    on<CreatePoolBankChanged>(
      (event, emit) => emit(state.copyWith(bank: event.bank)),
    );
    on<CreatePoolAccountNumberChanged>(
      (event, emit) => emit(state.copyWith(accountNumber: event.accountNumber)),
    );
    on<CreatePoolAccountLookupResultChanged>(
      (event, emit) => emit(state.copyWith(resolvedAccount: event.account)),
    );
  }
}
