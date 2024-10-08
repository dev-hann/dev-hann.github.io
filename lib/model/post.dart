import 'package:blog/model/post_author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String title,
    required PostAuthor author,
  }) = _Post;
}
