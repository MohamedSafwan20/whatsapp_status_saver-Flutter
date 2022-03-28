import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = Get.arguments;

    return Scaffold(
      body: PhotoView(
        imageProvider: FileImage(File(arguments["image"])),
      ),
    );
  }
}
