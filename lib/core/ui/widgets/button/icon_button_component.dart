import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  Widget icon;
  String tooltip;
  Function() onPressed;

  IconButtonComponent(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.tooltip = ""});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Tooltip(message: tooltip, child: icon),
      ),
    );
  }
}
