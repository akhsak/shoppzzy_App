import 'package:flutter/material.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

alertSheet(BuildContext context,
    {onPressed, alertMessage, confirmButtonLabel}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: [
            textPoppins(
                name: alertMessage, fontweight: FontWeight.w600, fontsize: 15),
          ],
        ),
        actions: [
          ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 4, 5, 5)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: textPoppins(name: 'CANCEL', color: Colors.white)),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 1, 1, 1))),
              onPressed: onPressed,
              child:
                  textPoppins(name: confirmButtonLabel, color: Colors.white)),
        ],
      );
    },
  );
}