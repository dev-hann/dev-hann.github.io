import 'package:blog/model/post_author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String title,
    PostAuthor? author,
    String? content,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json["name"],
    );
  }
}
