

// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/product_model.dart';
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
              
               IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
              Center(
                child: textPoppins(
                  name: 'wishlist',
                  fontsize: 25,
                  fontweight: FontWeight.w600,
                ),
              ),
              
              Consumer<ProductProvider>(
                builder: (context, ProductProvider, child) {
                  final wishlistItems = checkUser(ProductProvider);
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
                      return HomeContainer(
                        value: ProductProvider,
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

  List<ProductModel> checkUser(ProductProvider productProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<ProductModel> myProducts = [];
    for (var product in productProvider.allProductList) {
      if (product.wishList!.contains(user)) {
        myProducts.add(product);
      }
    }
    return myProducts;
  }
}