import 'package:co_buy/core/validation/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';
part 'signup_form_bloc.freezed.dart';

/// Owns the signup form's field values and validity so the page is a pure
/// renderer. Submission itself stays with `AuthBloc`, which serves every
/// auth flow — this bloc is only the form.
@injectable
class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  SignupFormBloc() : super(const SignupFormState()) {
    on<SignupFirstNameChanged>(
      (event, emit) => emit(state.copyWith(firstName: event.firstName)),
    );
    on<SignupLastNameChanged>(
      (event, emit) => emit(state.copyWith(lastName: event.lastName)),
    );
    on<SignupEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<SignupPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );
  }
}
