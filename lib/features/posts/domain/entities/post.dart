import 'package:equatable/equatable.dart';

/// Domain entity for a post. Plain and immutable — no JSON, no annotations;
/// serialization concerns live in the data layer's [PostDto].
class Post extends Equatable {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    this.userId,
  });

  final int id;
  final String title;
  final String body;
  final int? userId;

  @override
  List<Object?> get props => [id, title, body, userId];
}
