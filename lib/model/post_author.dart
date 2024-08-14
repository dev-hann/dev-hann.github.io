import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_author.freezed.dart';

@freezed
class PostAuthor with _$PostAuthor {
  const factory PostAuthor({
    required String name,
    required DateTime dateTime,
  }) = _PostAuthor;
}
