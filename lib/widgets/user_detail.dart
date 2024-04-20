import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_app_firebase/widgets/icons.dart';

class ProfileWidgets {
  Widget textFormFieldBox(
    bool clickBool,
    Size size,
    value,
    String label, {
    controller,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Material(
      elevation: 10,
      shadowColor: const Color.fromARGB(77, 0, 0, 0),
      child: clickBool == true
          ? ListTile(
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 53, 53),
                  fontSize: size.width * .03,
                ),
              ),
              subtitle: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: size.width * .035,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: TextFormField(
                inputFormatters: inputFormatter != null ? [inputFormatter] : [],
                keyboardType: keyboardType ?? TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  labelText: label,
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
    );
  }

  Widget textdBox(
    context,
    Size size,
    value,
    String label, {
    IconData? iconData,
    VoidCallback? onTap,
  }) {
    return Material(
      elevation: 10,
      shadowColor: const Color.fromARGB(77, 0, 0, 0),
      child: ListTile(
        trailing: iconData != null
            ? IconsWidgets().IconButtonWidget(context, size, iconData: iconData)
            : null,
        onTap: onTap,
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 53, 53, 53),
            fontSize: size.width * .03,
          ),
        ),
        subtitle: Text(
          value ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: size.width * .035,
          ),
        ),
      ),
    );
  }
}
