import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../models/failure.dart';
import '../../models/post.dart';
import 'fake_repo.dart';

enum NotifierState { initial, loading, loaded, error }

class PostChangeNotifier extends ChangeNotifier {
  final _postService = PostService();

  NotifierState _state = NotifierState.initial;

  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  late Either<Failure, Post> _post;

  Either<Failure, Post> get post => _post;

  void _setPost(Either<Failure, Post> post) {
    _post = post;
    notifyListeners();
  }

  Failure? _failure;

  Failure? get failure => _failure;

  /*void _setFailure(Failure failure) {
    print(failure.message);
    _state = NotifierState.error;
    _failure = failure;
    notifyListeners();
  }*/

  void getOnePost() async {
    _setState(NotifierState.loading);
    await Task(() => _postService.getOnePost())
        // Automatically catches exceptions
        .attempt()
        // Converts Task back into a Future
        .map(
      // Grab only the *left* side of Either<Object, Post>
          (either) => either.leftMap((obj) {
        // Cast the Object into a Failure
        return obj as Failure;
      }),
    )
        .run()
        .then((value) => _setPost(value));
    _setState(NotifierState.loaded);
  }
}
