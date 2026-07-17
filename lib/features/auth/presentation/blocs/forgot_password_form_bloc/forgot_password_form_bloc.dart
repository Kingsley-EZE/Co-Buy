import 'package:co_buy/core/validation/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_form_event.dart';
part 'forgot_password_form_state.dart';
part 'forgot_password_form_bloc.freezed.dart';

/// Owns the forgot-password form's field values and validity so the page is a
/// pure renderer. Submission itself stays with `AuthBloc`, which serves every
/// auth flow — this bloc is only the form.
@injectable
class ForgotPasswordFormBloc
    extends Bloc<ForgotPasswordFormEvent, ForgotPasswordFormState> {
  ForgotPasswordFormBloc() : super(const ForgotPasswordFormState()) {
    on<ForgotPasswordEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
  }
}
