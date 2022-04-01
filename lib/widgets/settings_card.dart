import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/config/colors.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key}) : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.create_new_folder,
                  color: color["primary"],
                  size: 25,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color["primaryLight"].withOpacity(0.4)),
            ),
            const Text(
              "Change download path",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Container(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
            ),
            decoration: BoxDecoration(
                color: color["disabled"],
                borderRadius: BorderRadius.circular(10)
                // border: Border.all(color: Colors.red, width: 5)
                ))
      ],
    );
  }
}
