import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/status_tile.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: homeController.getRandomVideoSize(),
                child: const StatusTile()),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: homeController.getRandomVideoSize(),
                child: const StatusTile()),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: homeController.getRandomVideoSize(),
                child: const StatusTile()),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: homeController.getRandomVideoSize(),
                child: const StatusTile()),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: homeController.getRandomVideoSize(),
                child: const StatusTile()),
          ],
        ),
      ),
    );
  }
}
