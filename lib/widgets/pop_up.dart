
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/widgets/button.dart';
import 'package:olx_app_firebase/widgets/button_widget.dart';
import 'package:olx_app_firebase/widgets/text.dart';

class PopupWidgets {
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> showLoadingIndicator(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> showLoadingIndicatorWithoutColor(context) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Color.fromARGB(106, 0, 0, 0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> showLoadingIndicatorWithFunction(BuildContext context,
      {required Future<void> Function() function}) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        color: Color.fromARGB(76, 0, 0, 0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    await function();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  showConfirmationDialog(BuildContext context,
      {String? title, required String content, required String label}) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: TextWidgets().titleText2(
              context,
              text: title ?? '',
              color: Colors.red,
            ),
          ),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false when canceled
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true when confirmed
              },
              child: Text(label),
            ),
          ],
        );
      },
    );
  }

  Future<void> showWarningDialog(BuildContext context,
      {required String label,
      required VoidCallback onPressed,
      required String text,
      String? title}) {
    final Size size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextWidgets().BodyText(context, text: text),
        surfaceTintColor: Colors.white,
        title: Center(
          child: TextWidgets().titleText2(
            context,
            text: title ?? 'Warning',
            color: Colors.red,
          ),
        ),
        actions: [
          ButtonWidget().textButtonWidget(
            size,
            context,
            label: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // ButtonWidgets().textButtonWidget(
          //   size,
          //   context,
          //   color: Colors.red,
          //   label: label,
          //   onPressed: onPressed,
          // ),
          TextButton(onPressed: () => onPressed, child: Text(label))
        ],
      ),
    );
  }
}