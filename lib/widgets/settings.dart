import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/settings_card.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SettingsCard(
              onPressed: () {
                homeController.changeDownloadLocation(
                    context: context, currentLocation: "/storage/emulated/0");
              },
            ),
          )
        ],
      ),
    );
  }
}
