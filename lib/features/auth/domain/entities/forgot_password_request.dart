import 'package:equatable/equatable.dart';

class ForgotPasswordRequest extends Equatable {
  const ForgotPasswordRequest({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}
