import 'package:dio/dio.dart';

const _apiURL = "https://api.github.com/repos/dev-hann/dev-hann.github.io";
const _path = "asset/post";

class PostService {
  final _dio = Dio();

  Future<Response> requestPostList() {
    const url = "$_apiURL/contents/$_path/";
    return _dio.get(url);
  }

  Future<Response> requestPostCommitData(String name) {
    final url = "$_apiURL/commits?path=$_path/$name";
    return _dio.get(url);
  }

  Future<Response> requestPostContent(String name) {
    final url =
        "https://raw.githubusercontent.com/dev-hann/dev-hann.github.io/main/$_path/$name";
    return _dio.get(url);
  }
}
