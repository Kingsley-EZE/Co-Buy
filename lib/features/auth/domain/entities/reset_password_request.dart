import 'package:equatable/equatable.dart';

class ResetPasswordRequest extends Equatable {
  const ResetPasswordRequest({
    required this.email,
    required this.otp,
    required this.newPassword,
  });

  final String email;
  final String otp;
  final String newPassword;

  @override
  List<Object?> get props => [email, otp, newPassword];
}
