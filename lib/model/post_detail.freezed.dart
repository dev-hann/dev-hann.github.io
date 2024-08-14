// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostDetail {
  String get title => throw _privateConstructorUsedError;
  PostAuthor get author => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDetailCopyWith<PostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailCopyWith<$Res> {
  factory $PostDetailCopyWith(
          PostDetail value, $Res Function(PostDetail) then) =
      _$PostDetailCopyWithImpl<$Res, PostDetail>;
  @useResult
  $Res call({String title, PostAuthor author, String content});

  $PostAuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$PostDetailCopyWithImpl<$Res, $Val extends PostDetail>
    implements $PostDetailCopyWith<$Res> {
  _$PostDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthor,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostAuthorCopyWith<$Res> get author {
    return $PostAuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostDetailImplCopyWith<$Res>
    implements $PostDetailCopyWith<$Res> {
  factory _$$PostDetailImplCopyWith(
          _$PostDetailImpl value, $Res Function(_$PostDetailImpl) then) =
      __$$PostDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, PostAuthor author, String content});

  @override
  $PostAuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$$PostDetailImplCopyWithImpl<$Res>
    extends _$PostDetailCopyWithImpl<$Res, _$PostDetailImpl>
    implements _$$PostDetailImplCopyWith<$Res> {
  __$$PostDetailImplCopyWithImpl(
      _$PostDetailImpl _value, $Res Function(_$PostDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? content = null,
  }) {
    return _then(_$PostDetailImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as PostAuthor,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostDetailImpl implements _PostDetail {
  const _$PostDetailImpl(
      {required this.title, required this.author, required this.content});

  @override
  final String title;
  @override
  final PostAuthor author;
  @override
  final String content;

  @override
  String toString() {
    return 'PostDetail(title: $title, author: $author, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, author, content);

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDetailImplCopyWith<_$PostDetailImpl> get copyWith =>
      __$$PostDetailImplCopyWithImpl<_$PostDetailImpl>(this, _$identity);
}

abstract class _PostDetail implements PostDetail {
  const factory _PostDetail(
      {required final String title,
      required final PostAuthor author,
      required final String content}) = _$PostDetailImpl;

  @override
  String get title;
  @override
  PostAuthor get author;
  @override
  String get content;

  /// Create a copy of PostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDetailImplCopyWith<_$PostDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
