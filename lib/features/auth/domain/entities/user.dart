import 'package:equatable/equatable.dart';

/// The signed-in user as the domain sees it.
class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.name,
    required this.isVerified,
    required this.role,
    this.avatar,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String name;
  final bool isVerified;
  final String role;
  final String? avatar;
  final String? phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    name,
    isVerified,
    role,
    avatar,
    phone,
    createdAt,
    updatedAt,
  ];
}
