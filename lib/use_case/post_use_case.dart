import 'package:blog/model/post.dart';
import 'package:blog/model/post_author.dart';
import 'package:blog/model/post_detail.dart';
import 'package:blog/service/post_service.dart';

class PostUseCase {
  final _service = PostService();

  Future<List<Post>> requestPostList() async {
    final List<Post> postList = [];
    final postResponse = await _service.requestPostList();
    final postDataList = List.from(postResponse.data);
    for (final postData in postDataList) {
      final postTitle = postData["name"];
      final commitResponse = await _service.requestPostCommitData(postTitle);
      final commitDataList = List.from(commitResponse.data);
      final authorData = commitDataList.first["commit"]["author"];
      postList.add(
        Post(
          title: postTitle,
          author: PostAuthor(
            name: authorData["name"],
            dateTime: DateTime.parse(authorData["date"]),
          ),
        ),
      );
    }
    return postList;
  }

  Future<PostDetail> requestPostDetail(Post post) async {
    final contentResponse = await _service.requestPostContent(post.title);
    return PostDetail(
      title: post.title,
      author: post.author,
      content: contentResponse.data,
    );
  }
}
