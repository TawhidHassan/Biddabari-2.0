import 'package:flutter/material.dart';


class SettingsMenu extends StatelessWidget {
  final Color? color;
  final Widget? icon;

  const SettingsMenu({super.key, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container();
            },
          ).whenComplete((){});
        },

        icon: icon ?? Icon(
          Icons.more_vert,
          color: color ?? Colors.white,
        ));
  }
}
