import 'package:co_buy/core/validation/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';
part 'login_form_bloc.freezed.dart';

/// Form fields and validity only; submission stays with [AuthBloc].
@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<LoginEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<LoginPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );
    on<LoginRememberMeToggled>(
      (event, emit) => emit(state.copyWith(rememberMe: !state.rememberMe)),
    );
  }
}
