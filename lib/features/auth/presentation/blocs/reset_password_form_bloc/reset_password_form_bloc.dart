import 'package:co_buy/core/validation/app_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_form_event.dart';
part 'reset_password_form_state.dart';
part 'reset_password_form_bloc.freezed.dart';

/// Form fields and validity only; submission stays with [AuthBloc].
@injectable
class ResetPasswordFormBloc
    extends Bloc<ResetPasswordFormEvent, ResetPasswordFormState> {
  ResetPasswordFormBloc() : super(const ResetPasswordFormState()) {
    on<ResetPasswordOtpChanged>(
      (event, emit) => emit(state.copyWith(otp: event.otp)),
    );
    on<ResetPasswordNewPasswordChanged>(
      (event, emit) => emit(state.copyWith(newPassword: event.newPassword)),
    );
  }
}
