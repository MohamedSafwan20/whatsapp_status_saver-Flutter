import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/saved_tile.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
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
          children: homeController
              .getAllStatus()
              .map(
                (status) => StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: homeController.getRandomVideoSize(),
                    child: SavedTile(
                      statusPath: status["file"].path,
                      statusType: status["type"],
                    )),
              )
              .toList(),
        ),
      ),
    );
  }
}
