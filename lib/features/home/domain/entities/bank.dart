import 'package:equatable/equatable.dart';

/// A bank the beneficiary account can belong to, as the domain sees it.
class Bank extends Equatable {
  const Bank({required this.name, required this.code});

  final String name;
  final String code;

  @override
  List<Object?> get props => [name, code];
}
