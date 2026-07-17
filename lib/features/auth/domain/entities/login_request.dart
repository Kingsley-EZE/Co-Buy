
import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable{
  const LoginRequest({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  final String username;
  final String password;
  final int? expiresInMins;

  @override
  List<Object?> get props => [username, password, expiresInMins];
}