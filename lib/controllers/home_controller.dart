import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_saver/config/constants.dart';
import 'package:whatsapp_status_saver/services/file_service.dart';

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

  List<Map> getAllStatus() {
    Directory directory = Directory(constant["WHATSAPP_STATUS_DIRECTORY_PATH"]);
    List<FileSystemEntity> statuses =
        directory.listSync(recursive: false).toList();

    statuses.removeWhere((file) =>
        !FileService.isVideo(file.path) && !FileService.isImage(file.path));

    return statuses
        .map((file) => {
              "file": file,
              "type": FileService.isVideo(file.path) ? "video" : "image"
            })
        .toList();
  }

  List<Map> getAllSavedStatus() {
    Directory directory = Directory(constant["APP_DIRECTORY_PATH"]);
    List<FileSystemEntity> statuses =
        directory.listSync(recursive: false).toList();

    statuses.removeWhere((file) =>
        !FileService.isVideo(file.path) && !FileService.isImage(file.path));

    return statuses
        .map((file) => {
              "file": file,
              "type": FileService.isVideo(file.path) ? "video" : "image"
            })
        .toList();
  }

  void requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isDenied | status.isPermanentlyDenied) {}
  }

  void initializeVideoPlayer(String video) async {
    return await VideoPlayerController.file(File(video)).initialize();
  }

  void createAppFolder() async {
    final path = Directory("storage/emulated/0/${constant['APP_FOLDER_NAME']}");

    if (!(await path.exists())) {
      path.create();
    }
  }

  void saveStatus({required String statusPath}) async {
    var file = await FileService.copyFile(
        sourceFile: File(statusPath),
        to: "storage/emulated/0/${constant['APP_FOLDER_NAME']}");

    if (file == null) {
      print("error");
    } else {
      update(["saved"]);
      print("success");
    }
  }

  void deleteStatus({required String statusPath}) {
    var res = FileService.deleteFile(file: File(statusPath));

    if (res) {
      update(["saved"]);
      print("success");
    } else {
      print("error");
    }
  }
}
