import 'package:equatable/equatable.dart';

class SignupRequest extends Equatable {
  const SignupRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [firstName, lastName, email, password];
}
