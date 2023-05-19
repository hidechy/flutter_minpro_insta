import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_minpro_insta/viewmodels/post_viewmodel.dart';

import '../constants.dart';

class PostUploadScreen extends StatelessWidget {
  const PostUploadScreen({super.key, required this.type});

  final UploadType type;

  ///
  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    if (!postViewModel.isImagePicked && !postViewModel.isLoading) {
      Future(() {
        postViewModel.pickImage(type: type);
      });
    }

    return const Placeholder();
  }
}
