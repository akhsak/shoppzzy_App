
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:lottie/lottie.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/view/screens/details_page.dart';
// import 'package:olx_app_firebase/widgets/navigator.dart';
// import 'package:olx_app_firebase/widgets/pop_up.dart';
// import 'package:olx_app_firebase/widgets/text.dart';
// import 'package:provider/provider.dart';

// class SoldProductPage extends StatelessWidget {
//   const SoldProductPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       // appBar: AppBarWidgets().appBar(
//       //   title: 'My Products',
//       //   context,
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<ProductProvider>(
//               builder: (context, provider, _) {
//                 final List<ProductModel> myProducts =
//                     filteringMyProduct(provider);
//                 return myProducts.isNotEmpty
//                     ? Expanded(
//                         child: ListView.separated(
//                           itemCount: myProducts.length,
//                           separatorBuilder: (context, index) => const Divider(),
//                           itemBuilder: (context, index) {
//                             final product = myProducts[index];
//                             return Slidable(
//                               startActionPane:
//                                   ActionPane(motion: ScrollMotion(), children: [
//                                 SlidableAction(
//                                   // borderRadius: BorderRadius.circular(20),
//                                   onPressed: (context) async {
//                                     bool confirmDelete = await PopupWidgets()
//                                         .showConfirmationDialog(context,
//                                             title: 'Delete Product',
//                                             content:
//                                                 '"Are you sure you want to delete this product?"',
//                                             label: 'Delete');
//                                     if (confirmDelete) {
//                                       PopupWidgets()
//                                           .showLoadingIndicator(context);
//                                       await provider
//                                           .deleteProduct(product.id);

//                                       PopupWidgets().showSuccessSnackbar(
//                                           context, 'Item Deleted successfully');
//                                     }
//                                   },
//                                   backgroundColor:
//                                       Color.fromARGB(255, 162, 2, 2),
//                                   foregroundColor: Colors.white,
//                                   icon: Icons.delete,
//                                   label: 'Delete',
//                                 ),
//                                 SizedBox(
//                                   width: size.width * .02,
//                                 ),
//                               ]),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: GestureDetector(
//                                   onTap: () => NavigatorWidget().push(context,
//                                       DetailsPage(name: product)),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: size.width * .2,
//                                         width: size.width * .2,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     product.image.toString()),
//                                                 fit: BoxFit.cover),
//                                             color: Colors.grey,
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(15))),
//                                       ),
//                                       SizedBox(
//                                         width: size.width * .02,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               TextWidgets().titleText2(context,
//                                                   text:
//                                                       product.title.toString()),
//                                               TextWidgets().SubtitleText(
//                                                   context,
//                                                   text: product.category
//                                                       .toString()),
//                                               Row(
//                                                 children: [
//                                                   TextWidgets().titleText2(
//                                                       context,
//                                                       text: product.price
//                                                           .toString()),
//                                                   SizedBox(
//                                                     width: size.width * .04,
//                                                   ),
//                                                   TextWidgets().SubtitleText(
//                                                       context,
//                                                       text: '/Sold',
//                                                       color: Colors.green),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : Center(
//                         child: Lottie.asset(
//                             width: size.width * .20,
//                             height: size.width * .20,
//                             'assets/LottieFiles_ Download Free lightweight animations for website & apps..html'),
//                       );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   filteringMyProduct(ProductProvider provider) {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       return null;
//     }

//     final user = currentUser.email ?? currentUser.phoneNumber;

//     List<ProductModel> myProducts = provider.allProductList
//         .where((product) => product.name == user && product.isSold == true)
//         .toList();
//     return myProducts;
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/view/screens/product_details_page.dart';
import 'package:olx_app_firebase/widgets/navigator.dart';
import 'package:olx_app_firebase/widgets/pop_up.dart';
import 'package:olx_app_firebase/widgets/text.dart';
import 'package:provider/provider.dart';

class SoldProductPage extends StatelessWidget {
  const SoldProductPage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProductProvider>(
              builder: (context, provider, _) {
                final List<ProductModel>? myProducts =
                    filteringMyProduct(provider);
                return myProducts != null && myProducts.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: myProducts.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final product = myProducts[index];
                            return Slidable(
                              startActionPane:
                                  ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    bool confirmDelete = await PopupWidgets()
                                        .showConfirmationDialog(context,
                                            title: 'Delete Product',
                                            content:
                                                '"Are you sure you want to delete this product?"',
                                            label: 'Delete');
                                    if (confirmDelete) {
                                      PopupWidgets()
                                          .showLoadingIndicator(context);
                                      provider.deleteProduct(product.id!);
                                      PopupWidgets().showSuccessSnackbar(
                                          context, 'Item Deleted successfully');
                                    }
                                  },
                                  backgroundColor:
                                      Color.fromARGB(255, 162, 2, 2),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                              ]),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () => NavigatorWidget().push(context,
                                     ProductDetailsPage( products: product,)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: size.width * .2,
                                        width: size.width * .2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    product.image.toString()),
                                                fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidgets().titleText2(context,
                                                  text:
                                                      product.title.toString()),
                                              TextWidgets().SubtitleText(
                                                  context,
                                                  text: product.category
                                                      .toString()),
                                              Row(
                                                children: [
                                                  TextWidgets().titleText2(
                                                      context,
                                                      text: product.price
                                                          .toString()),
                                                  SizedBox(
                                                    width: size.width * .04,
                                                  ),
                                                  TextWidgets().SubtitleText(
                                                      context,
                                                      text: '/Sold',
                                                      color: Colors.green),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Lottie.asset('assets/Animation - empty.json',
                            width: size.width * .20,
                            height: size.width * .20),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<ProductModel>? filteringMyProduct(ProductProvider provider) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    final user = currentUser.email ?? currentUser.phoneNumber;

    List<ProductModel> myProducts = provider.allProductList
        .where((product) => product.name == user && product.isSold == true)
        .toList();
    return myProducts;
  }
}
