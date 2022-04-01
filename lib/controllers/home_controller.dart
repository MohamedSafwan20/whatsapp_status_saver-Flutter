import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_saver/config/constants.dart';
import 'package:whatsapp_status_saver/services/file_service.dart';
import 'package:whatsapp_status_saver/utils/utils.dart';

class HomeController extends GetxController {
  int currentPage = 0;

  List<double> videoSizes = [0.9, 1.1, 2];

  RxList allStatus = [].obs;
  RxList allSavedStatus = [].obs;

  RxBool isDownloading = false.obs;
  RxBool isAllStatusLoading = false.obs;
  RxBool isAllSavedStatusLoading = false.obs;

  void onPageChange(int page) {
    currentPage = page;
    update();
  }

  double getRandomVideoSize() {
    Random random = Random();

    return videoSizes[random.nextInt(videoSizes.length)];
  }

  void getAllStatus() {
    isAllStatusLoading.value = true;

    Directory directory = Directory(constant["WHATSAPP_STATUS_DIRECTORY_PATH"]);
    List<FileSystemEntity> statuses =
        directory.listSync(recursive: false).toList();

    statuses.removeWhere((file) =>
        !FileService.isVideo(file.path) && !FileService.isImage(file.path));

    allStatus.value = statuses
        .map((file) => {
              "file": file,
              "type": FileService.isVideo(file.path) ? "video" : "image"
            })
        .toList();

    isAllStatusLoading.value = false;
  }

  void getAllSavedStatus() {
    isAllSavedStatusLoading.value = true;

    Directory directory = Directory(constant["APP_DIRECTORY_PATH"]);
    List<FileSystemEntity> statuses =
        directory.listSync(recursive: false).toList();

    statuses.removeWhere((file) =>
        !FileService.isVideo(file.path) && !FileService.isImage(file.path));

    allSavedStatus.value = statuses
        .map((file) => {
              "file": file,
              "type": FileService.isVideo(file.path) ? "video" : "image"
            })
        .toList();

    isAllSavedStatusLoading.value = false;
  }

  dynamic getSavedStatus({required String statusPath}) {
    try {
      File status = File(statusPath);

      Directory directory = Directory(constant["APP_DIRECTORY_PATH"]);
      List<FileSystemEntity> statuses =
          directory.listSync(recursive: false).toList();

      FileSystemEntity file = statuses.singleWhere((file) =>
          Utils.getFilenameFromFile(file as File) ==
          Utils.getFilenameFromFile(status));

      if (file.existsSync()) {
        return file;
      }
      return null;
    } catch (e) {
      return null;
    }
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

  void saveStatus({required String statusPath}) {
    isDownloading.value = true;
    update([statusPath]);

    var file = FileService.copyFile(
        sourceFile: File(statusPath),
        to: "storage/emulated/0/${constant['APP_FOLDER_NAME']}");

    if (file) {
      getAllSavedStatus();
      print("success");
    } else {
      print("error");
    }

    isDownloading.value = false;
    update([statusPath]);
  }

  void deleteStatus({required String statusPath}) {
    var res = FileService.deleteFile(file: File(statusPath));

    if (res) {
      getAllSavedStatus();
      update([statusPath]);
      print("success");
    } else {
      print("error");
    }
  }
}
