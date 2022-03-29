import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/services/intent_service.dart';
import 'package:whatsapp_status_saver/widgets/info_icon_button.dart';

class SavedTile extends StatefulWidget {
  const SavedTile(
      {Key? key, required this.statusPath, required this.statusType})
      : super(key: key);

  final String statusPath;
  final String statusType;

  @override
  State<SavedTile> createState() => _SavedTileState();
}

class _SavedTileState extends State<SavedTile> {
  late VideoPlayerController videoPlayerController;

  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.file(File(widget.statusPath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          widget.statusType == "video" &&
                  videoPlayerController.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: VideoPlayer(videoPlayerController))
              : Container(),
          const Align(
            alignment: Alignment.center,
            child: InfoIconButton(
              icon: Icons.folder_outlined,
              onPressed: IntentService.openGallery,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8),
            child: Align(
              child: InfoIconButton(
                icon: Icons.delete_outlined,
                onPressed: () {
                  homeController.deleteStatus(statusPath: widget.statusPath);
                },
              ),
              alignment: Alignment.bottomRight,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color["disabled"], width: 2.8),
          image: widget.statusType == "image"
              ? DecorationImage(
                  image: FileImage(File(widget.statusPath)), fit: BoxFit.fill)
              : null),
    );
  }
}
