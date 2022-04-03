import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    homeController.requestPermission();
    homeController.createAppFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!homeController.isPermissionsGranted.value) {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: color["error"],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.do_disturb_alt,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                      width: 240,
                      child: Text(
                        "Please allow permissions to use this app.",
                        style: TextStyle(
                          color: color["disabled"],
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ))
                ],
              ));
        }

        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: color["primary"],
          child: const Center(
              child: Image(
            image: AssetImage("assets/images/initial_page_logo.png"),
            width: 80,
            height: 80,
          )),
        );
      }),
    );
  }
}
