// // import 'package:flutter/material.dart';

// // class WishlistPage extends StatelessWidget {
// //   const WishlistPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('wishlist'),),
// //       body: ListTile()
      

      
// //     );
// //   }
// // }

// // ignore_for_file: use_key_in_widget_constructors


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/model/model.dart';
// import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
// import 'package:olx_app_firebase/widgets/text_style.dart';
// import 'package:provider/provider.dart';

// class WishListPage extends StatelessWidget {
//   const WishListPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               textPoppins(
//                 name: 'wishlist',
//                 fontsize: 25,
//                 fontweight: FontWeight.w600,
//               ),
//               Consumer<ProductProvider>(
//                 builder: (context, carProvider, child) {
//                   final wishlistItems = checkUser(carProvider);
//                   return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       childAspectRatio: 0.75,
//                     ),
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: wishlistItems.length,
//                     itemBuilder: (context, index) {
//                       final item = wishlistItems[index];
//                       return HomeContainer(
//                         value: carProvider,
//                         product: item,
                        
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<ProductModel> checkUser(ProductProvider carProvider) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       return [];
//     }
//     final user = currentUser.email ?? currentUser.phoneNumber;
//     List<ProductModel> myCars = [];
//     for (var car in carProvider.allCarList) {
//       if (car.wishList.contains(user)) {
//         myCars.add(car);
//       }
//     }
//     return myCars;
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/model.dart';
import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'wishlist',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              Consumer<ProductProvider>(
                builder: (context, carProvider, child) {
                  final wishlistItems = checkUser(carProvider);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];
                      return HomewishlistContainer(
                        key: UniqueKey(), // Add UniqueKey for each item
                        product: item,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ProductModel> checkUser(ProductProvider carProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<ProductModel> myCars = [];
    for (var car in carProvider.allCarList) {
      if (car.wishList.contains(user)) {
        myCars.add(car);
      }
    }
    return myCars;
  }
}

class HomewishlistContainer extends StatelessWidget {
  final ProductModel product;

  const HomewishlistContainer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProductProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
            textPoppins(
              name: product.name,
              fontweight: FontWeight.bold,
              fontsize: 16,
            ),
            SizedBox(height: size.height * .01),
            textPoppins(
              name: '${product.location} Kms',
              fontweight: FontWeight.w500,
              fontsize: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ ${product.price.toString()} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     // Perform delete operation
                //     value.deleteCar(product.id!);
                //   },
                //   icon: const Icon(
                //     Icons.delete,
                //     color: Colors.red,
                //   ),
                // ),
                IconButton(
                  onPressed: () {
                    final wish = value.wishListCheck(product);
                    value.wishlistClicked(product.id!, wish);
                  },
                  icon: value.wishListCheck(product)
                      ? const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}