import 'package:equatable/equatable.dart';

class VerifyEmailRequest extends Equatable {
  const VerifyEmailRequest({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  List<Object?> get props => [email, otp];
}
