import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
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
  void initState() {
    super.initState();

    homeController.getAllSavedStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isAllSavedStatusLoading.value) {
        return Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: color["primary"],
              strokeWidth: 4,
            ),
          ),
        );
      }

      if (homeController.allSavedStatus.isEmpty) {
        return Center(
            child: Text(
          "No Downloads",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color["primaryLight"]),
        ));
      }

      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: homeController.allSavedStatus
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
    });
  }
}
