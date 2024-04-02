import 'package:flutter/material.dart';

class IconsWidgets {
  Widget IconButtonWidget(BuildContext context, Size size,
      {required IconData iconData, VoidCallback? onPressed, Color? color}) {
    return IconButton(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          color: color,
          iconData,
          size: size.width * 0.06,
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget IconWidget(Size size, {required IconData iconData, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        iconData,
        color: color,
        size: size.width * 0.06,
      ),
    );
  }
}