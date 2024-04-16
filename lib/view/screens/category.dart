
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/widgets/icons.dart';
// import 'package:olx_app_firebase/widgets/text.dart';
// import 'package:provider/provider.dart';

// class CategoryPage extends StatelessWidget {
//   final String category;
//   CategoryPage({required this.category, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar( title: Text(category)),
//       body: Consumer<ProductProvider>(
//         builder: (context, value, child) {
//           final filteredProducts = value.allProductList
//               .where((product) =>
//                   product.category == category && product.isSold == false)
//               .toList();

//           return filteredProducts.isNotEmpty
//               ? GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: size.width * 0.05,
//                     crossAxisSpacing: size.width * 0.015,
//                     childAspectRatio: size.width / (size.width * 1.6),
//                   ),
//                   itemCount: filteredProducts.length,
//                   itemBuilder: (context, index) {
//                     final product = filteredProducts[index];
//                     return Stack(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: size.width * 0.42,
//                                 width: size.width * 0.42,
//                                 child: product.image!.isNotEmpty
//                                     ? Image.network(
//                                         product.image.toString(),
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Lottie.asset(
//                                         'assets/lottie/sellX logo.json'),
//                               ),
//                               const SizedBox(height: 10),
//                               TextWidgets()
//                                   .HeadingText(context, text: product.title!),
//                               TextWidgets()
//                                   .SubtitleText(context, text: product.brand!),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   TextWidgets().titleText2(context,
//                                       text: "₹${product.price.toString()}"),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           right: 2,
//                           bottom: 2,
//                           child: IconsWidgets().IconButtonWidget(
//                             context,
//                             size,
//                             iconData: Icons.favorite_border,
//                             onPressed: () {},
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 )
//               : Center(
//                   child: Lottie.asset(
//                       width: size.width * .20,
//                       height: size.width * .20,
//                       'assets/Animation -splash screen.json'),
//                 );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/widgets/icons.dart';
import 'package:olx_app_firebase/widgets/text.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  CategoryPage({required this.category, Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar( title: Text(category)),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          final filteredProducts = value.allProductList
              .where((product) =>
                  product.category == category && !product.isSold!)
              .toList();

          return filteredProducts.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * 0.05,
                    crossAxisSpacing: size.width * 0.015,
                    childAspectRatio: size.width / (size.width * 1.6),
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.width * 0.42,
                                width: size.width * 0.42,
                                child: product.image!.isNotEmpty
                                    ? Image.network(
                                        product.image.toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Lottie.asset(
                                        'assets/lottie/sellX logo.json'),
                              ),
                              const SizedBox(height: 10),
                              TextWidgets()
                                  .HeadingText(context, text: product.title!),
                              TextWidgets()
                                  .SubtitleText(context, text: product.brand!),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidgets().titleText2(context,
                                      text: "₹${product.price.toString()}"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 2,
                          child: IconsWidgets().IconButtonWidget(
                            context,
                            size,
                            iconData: Icons.favorite_border,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Center(
                  child: Lottie.asset(
                      'assets/Animation -splash screen.json'),
                );
        },
      ),
    );
  }
}
