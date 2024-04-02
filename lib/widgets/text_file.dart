import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidgets {
  Widget textFormField(
    Size size, {
    String? type,
    TextEditingController? controller,
    TextEditingController? cnfController,
    String? label,
    String? hitText,
    int? maxLine,
    String? prefixText,
    // int? maxLines,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 08),
      child: TextFormField(
        inputFormatters: inputFormatter != null ? [inputFormatter] : [],
        keyboardType: keyboardType ?? TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $label";
          } else if (type == "Email") {
            if (!EmailValidator.validate(value)) {
              return "Please enter a valid email address";
            }
          } else if (type == 'Password') {
            if (value.length < 6) {
              return 'Password should be at least 6 characters';
            }
          } else if (type == 'Confirm Password') {
            if (value != cnfController!.text) {
              return 'Passwords do not match';
            }
          }
          return null;
        },
        obscureText:
            type == "Password" || type == "Confirm Password" ? true : false,
        controller: controller,
        maxLength: maxLine,
        // maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixText: prefixText,
          hintText: hitText,
          labelStyle: GoogleFonts.montserrat(color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget textFormFieldRound(
    Size size, {
    String? type,
    TextEditingController? controller,
    TextEditingController? cnfController,
    String? label,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: inputFormatter != null ? [inputFormatter] : [],
          keyboardType: keyboardType ?? TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter $label";
            } else if (type == "Email") {
              if (!EmailValidator.validate(value)) {
                return "Please enter a valid email address";
              }
            } else if (type == 'Password') {
              if (value.length < 6) {
                return 'Password should be at least 6 characters';
              }
            } else if (type == 'Confirm Password') {
              if (value != cnfController!.text) {
                return 'Passwords do not match';
              }
            }
            return null;
          },
          obscureText:
              type == "Password" || type == "Confirm Password" ? true : false,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * .03)),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * .03)),
          ),
        ),
        SizedBox(
          height: size.width * 0.05,
        )
      ],
    );
  }
}