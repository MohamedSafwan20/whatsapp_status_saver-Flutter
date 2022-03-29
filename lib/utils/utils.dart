import 'dart:io';

class Utils {
  static String getFilenameFromFile(File file) {
    return file.path.split('/').last;
  }
}
