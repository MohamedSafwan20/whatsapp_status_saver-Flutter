import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
import 'package:whatsapp_status_saver/config/routes.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/info_icon_button.dart';

class StatusTile extends StatefulWidget {
  const StatusTile(
      {Key? key, required this.statusPath, required this.statusType})
      : super(key: key);

  final String statusPath;
  final String statusType;

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
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
          widget.statusType == "video"
              ? Align(
                  child: InfoIconButton(
                    icon: videoPlayerController.value.isPlaying
                        ? Icons.pause_outlined
                        : Icons.play_arrow,
                    onPressed: () {
                      videoPlayerController.value.isPlaying
                          ? videoPlayerController.pause()
                          : videoPlayerController.play();

                      setState(() {});
                    },
                  ),
                  alignment: Alignment.center,
                )
              : Align(
                  child: InfoIconButton(
                    icon: Icons.visibility_outlined,
                    onPressed: () {
                      Get.toNamed(route["IMAGE_VIEW"],
                          arguments: {"image": widget.statusPath});
                    },
                  ),
                  alignment: Alignment.center,
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8),
            child: Align(
              child: InfoIconButton(
                icon: Icons.file_download_outlined,
                onPressed: () {
                  homeController.saveStatus(statusPath: widget.statusPath);
                },
              ),
              alignment: Alignment.bottomRight,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color["disabled"], width: 2),
          image: widget.statusType == "image"
              ? DecorationImage(
                  image: FileImage(File(widget.statusPath)), fit: BoxFit.fill)
              : null),
    );
  }
}
