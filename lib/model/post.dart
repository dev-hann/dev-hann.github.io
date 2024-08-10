import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.title,
    required this.createdDateTime,
    required this.content,
  });
  final String title;
  final DateTime createdDateTime;
  final String content;

  @override
  List<Object?> get props => [
        title,
        createdDateTime,
        content,
      ];

  Post copyWith({
    String? title,
    DateTime? createdDateTime,
    String? content,
  }) {
    return Post(
      title: title ?? this.title,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      content: content ?? this.content,
    );
  }
}
