import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/failure.dart';
import '../../models/post.dart';

class FakeHttpClient {
  Future<String> getResponseBody() async {
    await Future.delayed(const Duration(milliseconds: 500));
    //! No Internet Connection
    throw const FileSystemException();
     //throw SocketException('No Internet');
    //! 404
     //throw HttpException('404');
    //! Invalid JSON (throws FormatException)
    //return 'abcd';
    return '{"userId":1,"id":1,"title":"nice title","body":"cool body"}';
  }
}

class PostService {
  final httpClient = FakeHttpClient();

  Future<Post> getOnePost() async {
    try {
      final responseBody = await httpClient.getResponseBody();
      return Post.fromJson(responseBody);
    } on SocketException {
      throw Failure(message: 'No Internet connection 😑');
    } on HttpException {
      throw Failure(message: "Couldn't find the post 😱");
    } on FormatException {
      throw Failure(message: "Bad response format 👎");
    }
  }
}
