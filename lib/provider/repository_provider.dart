import 'package:blog/model/post.dart';
import 'package:blog/use_case/post_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

class RepositoryState extends Equatable {
  const RepositoryState({
    this.query = "",
    this.postList = const [],
  });
  final String query;
  final List<Post> postList;

  @override
  List<Object?> get props => [
        query,
        postList,
      ];

  RepositoryState copyWith({
    String? query,
    List<Post>? postList,
  }) {
    return RepositoryState(
      query: query ?? this.query,
      postList: postList ?? this.postList,
    );
  }
}

@riverpod
class Repository extends _$Repository {
  final _useCase = PostUseCase();
  @override
  Future<RepositoryState> build() async {
    state = const AsyncValue.data(
      RepositoryState(),
    );
    await requestPostList();
    return state.value!;
  }

  Future requestPostList() async {
    try {
      state = const AsyncValue.loading();
      final list = await _useCase.requestPostList();
      state = AsyncValue.data(
        state.value!.copyWith(
          postList: list,
        ),
      );
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Post? loadPost(String title) {
    final list = state.value?.postList;
    if (list == null) {
      return null;
    }
    return list.firstWhere((post) {
      return post.title == title;
    });
  }

  void searchQuery(String query) {
    state = AsyncValue.data(
      state.value!.copyWith(
        query: query,
      ),
    );
  }
}
