import 'package:flutter/services.dart';

class IntentService {
  static openGallery() async {
    const platform = MethodChannel('status.saver.app');

    try {
      await platform.invokeMethod("GALLERY");

      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }
}
