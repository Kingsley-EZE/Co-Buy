import 'package:equatable/equatable.dart';

/// A server-defined category a pool can belong to.
class PoolCategory extends Equatable {
  const PoolCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  final String id;
  final String name;
  final String description;

  /// The server names are PascalCase identifiers ("BulkPurchase",
  /// "GroupGift") — split them into words for display.
  String get displayName =>
      name.replaceAllMapped(RegExp(r'(?<=[a-z])(?=[A-Z])'), (_) => ' ');

  @override
  List<Object?> get props => [id, name, description];
}
