import 'package:flutter/material.dart';

class NavigatorWidget {
  push(context, Widget location) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return location;
      },
    ));
  }

  pushReplacement(context, Widget location) {
    newMethod(context, location);
  }

  Future<dynamic> newMethod(context, Widget location) {
    return Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return location;
      },
    ));
  }

  pushRemoveUntil(context, Widget location) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => location,
        ),
        (route) => false);
  }
}
