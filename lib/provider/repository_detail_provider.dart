import 'package:blog/model/post.dart';
import 'package:blog/model/post_detail.dart';
import 'package:blog/use_case/post_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_detail_provider.g.dart';

@riverpod
class RepositoryDetail extends _$RepositoryDetail {
  final _useCase = PostUseCase();
  @override
  Future<PostDetail> build(Post post) async {
    await requestPostDetail(post);
    return state.value!;
  }

  Future requestPostDetail(Post post) async {
    try {
      state = const AsyncValue.loading();
      final postDetail = await _useCase.requestPostDetail(post);
      state = AsyncValue.data(postDetail);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
