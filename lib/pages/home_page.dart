import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_status_saver/controllers/home_controller.dart';
import 'package:whatsapp_status_saver/widgets/status.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Status"),
            elevation: 0,
          ),
          body: IndexedStack(
            index: homeController.currentPage,
            children: const [
              Status(),
              Center(
                child: Text("Saved"),
              ),
              Center(
                child: Text("Settings"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeController.currentPage,
            onTap: (index) {
              homeController.onPageChange(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.collections_outlined,
                    size: 30,
                  ),
                  label: "Status"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.downloading_outlined,
                    size: 30,
                  ),
                  label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 30,
                  ),
                  label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
