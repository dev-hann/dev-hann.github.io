import 'package:blog/model/post.dart';
import 'package:blog/service/post_service.dart';

class PostUseCase {
  final _service = PostService();

  Future<List<Post>> requestPostList() async {
    // final res = await _service.requestPostList();
    // final res.data
    return [];
  }
}
