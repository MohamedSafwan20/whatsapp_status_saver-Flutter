import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
import 'package:whatsapp_status_saver/config/routes.dart';
import 'package:whatsapp_status_saver/pages/home_page.dart';
import 'package:whatsapp_status_saver/pages/image_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
        primary: color["primary"],
        secondary: color["secondary"],
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: route["HOME"],
      getPages: [
        GetPage(name: route["HOME"], page: () => const HomePage()),
        GetPage(name: route["IMAGE_VIEW"], page: () => const ImagePage()),
      ],
    );
  }
}
