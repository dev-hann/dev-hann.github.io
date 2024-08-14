import 'dart:convert';

import 'package:blog/model/post.dart';
import 'package:blog/model/post_author.dart';
import 'package:blog/service/post_service.dart';

class PostUseCase {
  final _service = PostService();

  Future<List<Post>> requestPostList() async {
    final postResponse = await _service.requestPostList();
    final postDataList = List.from(postResponse.data);
    final postList = postDataList.map((e) {
      return Post(title: e["name"]);
    }).toList();
    for (int index = 0; index < postList.length; index++) {
      final post = postList[index];

      final commitResponse = await _service.requestPostCommitData(post.title);
      final commitDataList = List.from(commitResponse.data);
      final authorData = commitDataList.first["commit"]["author"];
      final author = PostAuthor(
        name: authorData["name"],
        dateTime: DateTime.parse(authorData["date"]),
      );

      final contentResponse = await _service.requestPostContent(post.title);
      postList[index] = post.copyWith(
        author: author,
        content: contentResponse.data,
      );
    }
    return postList;
  }
}
