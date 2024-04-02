import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_app_firebase/widgets/icons.dart';

class ButtonWidget {
  rectangleButton(Size size,
      {required String name, required VoidCallback? onPressed}) {
    return SizedBox(
      height: size.height * .08,
      width: size.width * .3,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(189, 0, 0, 0)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(name,
            style: GoogleFonts.montserrat(
                fontSize: size.width * .045,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Widget textButtonWidget(size, context,
      {required label, required VoidCallback? onPressed, Color? color}) {
    return TextButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        onPressed: onPressed!,
        child: Text(
          label,
          style: TextStyle(
              fontSize: size.width * .035, color: color ?? Colors.black),
        ));
  }

  Widget fullWidthElevatedButton(size,
      {required label, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: size.width * .14,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 0, 0, 0),
                // Color.fromARGB(255, 37, 157, 192),
              ),
            ),
            onPressed: () => onPressed!(),
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: size.width * .045,
                color: Colors.white,
              ),
            ),
          )),
    );
  }

  Widget fullWidthElevatedButtonWithIcon(size,
      {required label, VoidCallback? onPressed, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: size.width * .14,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 0, 0, 0),
                // Color.fromARGB(255, 37, 157, 192),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconsWidgets()
                    .IconWidget(size, iconData: icon!, color: Colors.white),
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * .045,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}