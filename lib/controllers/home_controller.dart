import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_status_saver/config/constants.dart';
import 'package:whatsapp_status_saver/services/video_service.dart';

class HomeController extends GetxController {
  int currentPage = 0;

  List<double> videoSizes = [0.9, 1.1, 2];

  void onPageChange(int page) {
    currentPage = page;
    update();
  }

  double getRandomVideoSize() {
    Random random = Random();

    return videoSizes[random.nextInt(videoSizes.length)];
  }

  List<FileSystemEntity> getAllStatus() {
    Directory directory = Directory(constant["WHATSAPP_STATUS_DIRECTORY_PATH"]);
    List<FileSystemEntity> statuses =
        directory.listSync(recursive: false).toList();

    statuses.removeWhere((file) => !VideoService.isVideo(file.path));

    return statuses;
  }

  void requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isDenied | status.isPermanentlyDenied) {}
  }
}
