import 'package:blog/model/post_author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail.freezed.dart';

@freezed
class PostDetail with _$PostDetail {
  const factory PostDetail({
    required String title,
    required PostAuthor author,
    required String content,
  }) = _PostDetail;
}
