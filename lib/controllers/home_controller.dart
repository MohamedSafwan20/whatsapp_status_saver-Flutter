import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentPage = 0;

  void onPageChange(int page) {
    currentPage = page;
    update();
  }
}
