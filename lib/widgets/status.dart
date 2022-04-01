import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/config/colors.dart';
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
  void initState() {
    super.initState();

    homeController.getAllStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isAllStatusLoading.value) {
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

      if (homeController.allStatus.isEmpty) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No Status found",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color["primaryLight"]),
            ),
            Container(
              width: 170,
              margin: const EdgeInsets.only(top: 5),
              child: Text("make sure you viewed status on whatsapp.",
                  style: TextStyle(fontSize: 17, color: color["disabledDark"]),
                  textAlign: TextAlign.center),
            )
          ],
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
            children: homeController.allStatus
                .map(
                  (status) => StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: homeController.getRandomVideoSize(),
                      child: StatusTile(
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
