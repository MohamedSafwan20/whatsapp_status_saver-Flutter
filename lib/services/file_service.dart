import 'dart:io';

import 'package:mime/mime.dart';
import 'package:whatsapp_status_saver/utils/utils.dart';

class FileService {
  static bool isVideo(String path) {
    String? type = lookupMimeType(path);

    if (type == null || !type.startsWith("video/")) {
      return false;
    }

    return true;
  }

  static bool isImage(String path) {
    String? type = lookupMimeType(path);

    if (type == null || !type.startsWith("image/")) {
      return false;
    }

    return true;
  }

  static Future copyFile({required File sourceFile, required String to}) async {
    try {
      return await sourceFile
          .copy("$to/${Utils.getFilenameFromFile(sourceFile)}");
    } catch (_) {
      return null;
    }
  }

  static bool deleteFile({required File file}) {
    try {
      file.deleteSync();

      return true;
    } catch (_) {
      return false;
    }
  }
}
