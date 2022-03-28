import 'package:mime/mime.dart';

class VideoService {
  static bool isVideo(String path) {
    String type = lookupMimeType(path)!;

    if (type.startsWith("video/")) {
      return true;
    }

    return false;
  }

  static bool isImage(String path) {
    String type = lookupMimeType(path)!;

    if (type.startsWith("image/")) {
      return true;
    }

    return false;
  }
}
