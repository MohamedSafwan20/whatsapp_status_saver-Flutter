import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
import 'package:whatsapp_status_saver/config/routes.dart';
import 'package:whatsapp_status_saver/pages/home_page.dart';
import 'package:whatsapp_status_saver/pages/image_page.dart';
import 'package:whatsapp_status_saver/pages/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
            primary: color["primary"],
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: route["INIT"],
      getPages: [
        GetPage(name: route["INIT"], page: () => const InitialPage()),
        GetPage(name: route["HOME"], page: () => const HomePage()),
        GetPage(name: route["IMAGE_VIEW"], page: () => const ImagePage()),
      ],
    );
  }
}
