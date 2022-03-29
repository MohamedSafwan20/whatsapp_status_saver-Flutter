import 'package:mime/mime.dart';

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
}
