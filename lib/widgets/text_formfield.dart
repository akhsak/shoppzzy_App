import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_app_firebase/controller/product_provider.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;

  final bool? obscureText;
  final TextEditingController controller;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? focusErrorBorder;
  final Widget? suffixIcon;
  final String? validateMsg;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.enabledBorder,
    this.focusedBorder,
    this.focusErrorBorder,
    this.suffixIcon,
    this.validateMsg,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMsg ?? 'value is empty';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.grey[200],
          filled: true,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: focusErrorBorder),
    );
  }
}

// Widget dateTextFormField() {
//   return Consumer<DatabaseProvider>(
//     builder: (context, value, child) => TextFormField(
//       onTap: () => value.selectDate(context),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "Please select Date";
//         } else {
//           return null;
//         }
//       },
//       controller: value.brandController,
//       keyboardType: TextInputType.datetime,
//       decoration: InputDecoration(
//         fillColor: Colors.grey[200],
//         labelText: 'Date',
//         suffixIcon: IconButton(
//           onPressed: () {
//             value.selectDate(context);
//           },
//           icon: const Icon(Icons.calendar_today),
//         ),
//         focusedBorder: const OutlineInputBorder(
//          borderSide: BorderSide(color: Colors.black),
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//       ),
//     ),
//   );
//}