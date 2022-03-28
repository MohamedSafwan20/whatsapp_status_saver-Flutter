import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/widgets/info_icon_button.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            child: InfoIconButton(
              icon: Icons.play_arrow,
              onPressed: () {},
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
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.fill),
          color: Colors.red,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
