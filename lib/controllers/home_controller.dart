import 'dart:math';

import 'package:get/get.dart';

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
}
