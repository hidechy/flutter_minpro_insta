import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_minpro_insta/constants.dart';

import '../repository/post_repository.dart';
import '../repository/user_repository.dart';

class PostViewModel extends ChangeNotifier {
  PostViewModel({required this.postRepository, required this.userRepository});

  final PostRepository postRepository;
  final UserRepository userRepository;

  bool isLoading = false;
  bool isImagePicked = false;

  File? imageFile;

  ///
  Future<void> pickImage({required UploadType type}) async {
    isImagePicked = false;
    isLoading = true;

    notifyListeners();

    imageFile = await postRepository.pickImage(type: type);

    print('aaaaa');
    print(imageFile);
    print('aaaaa');

    if (imageFile != null) {
      isImagePicked = true;
    }

    isLoading = false;

    notifyListeners();
  }
}
