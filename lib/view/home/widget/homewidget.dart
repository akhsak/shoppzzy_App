
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/screens/category.dart';
import 'package:olx_app_firebase/widgets/navigator.dart';

class HomeWidgets {
  // Widget specialProduct(Size size, {required String imagePath}) {
  //   return Container(
  //     width: size.width * .5,
  //     height: size.width * .3,
  //     decoration: BoxDecoration(
  //       image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
  //       color: const Color.fromARGB(255, 30, 29, 29),
  //     ),
  //   );
  // }

  Widget categoryItems(BuildContext context, Size size,
      {required String category, required String imagePath}) {
    return GestureDetector(
      onTap: () => NavigatorWidget().push(
          context,
          CategoryPage(
            category: category,
          )),
      child: Container(
        width: size.width * .2,
        height: size.width * .2,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill, // Adjust the fit property as needed
          ),
        ),
      ),
    );
  }
}
