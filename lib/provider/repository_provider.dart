import 'package:blog/model/post.dart';
import 'package:blog/use_case/post_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
class Repository extends _$Repository {
  final _useCase = PostUseCase();
  @override
  Future<List<Post>> build() async {
    await requestPostList();
    return state.value!;
  }

  Future requestPostList() async {
    try {
      state = const AsyncValue.loading();
      final list = await _useCase.requestPostList();
      state = AsyncValue.data(list);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Post? loadPost(String title) {
    final list = state.value;
    if (list == null) {
      return null;
    }
    return list.firstWhere((post) {
      return post.title == title;
    });
  }
}
