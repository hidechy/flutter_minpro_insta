// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_minpro_insta/screens/post_upload_screen.dart';

import '../../../constants.dart';
import '../../../generated/l10n.dart';
import '../../components/button_with_icon.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonWithIcon(
                iconData: FontAwesomeIcons.images,
                label: S.of(context).gallery,
                onPressed: () {
                  _openPostUploadScreen(
                    type: UploadType.GALLERY,
                  );
                },
              ),
              const SizedBox(height: 20),
              ButtonWithIcon(
                iconData: FontAwesomeIcons.camera,
                label: S.of(context).camera,
                onPressed: () {
                  _openPostUploadScreen(
                    type: UploadType.CAMERA,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void _openPostUploadScreen({required UploadType type}) {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => PostUploadScreen(type: type),
      ),
    );
  }
}
