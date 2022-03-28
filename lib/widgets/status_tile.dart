import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/info_icon_button.dart';

class StatusTile extends StatefulWidget {
  const StatusTile({Key? key, required this.statusPath}) : super(key: key);

  final String statusPath;

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            child: InfoIconButton(
              icon: Icons.play_arrow,
              onPressed: () {
                homeController.getAllStatus();
              },
            ),
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8),
            child: Align(
              child: InfoIconButton(
                icon: Icons.file_download_outlined,
                onPressed: () {},
              ),
              alignment: Alignment.bottomRight,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(File(widget.statusPath)), fit: BoxFit.fill),
          color: Colors.red,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
