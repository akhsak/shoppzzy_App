// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/controller/authontication_provider.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
// import 'package:olx_app_firebase/view/home/widget/widget_home.dart';
// import 'package:olx_app_firebase/view/screens/details_page.dart';
// import 'package:olx_app_firebase/view/screens/userdetails.dart';
// import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
// import 'package:olx_app_firebase/widgets/text_style.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   // final List<Map<String, dynamic>> categories = [
//   //   {'name': 'T-Shirt', 'image': 'assets/T-shirtt_img.jpg'},
//   //   {'name': 'Pants', 'image': 'assets/pants_img.jpg'},
//   //   {'name': 'Dress', 'image': 'assets/dress__img.jpg'},
//   //   {'name': 'Jackets', 'image': 'assets/jackets_img.jpg'},
//   //   {'name': 'Shoes', 'image': 'assets/shoes_img.jpg'},
//   //   {'name': 'Bag', 'image': 'assets/bag_img.jpg'},
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     final productProvider =
//         Provider.of<ProductProvider>(context, listen: false);
//     Size size = MediaQuery.of(context).size;
//     Provider.of<ProductProvider>(context, listen: false).getAllProduct();
//     Provider.of<AuthenticationProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 241, 242, 244),
//         toolbarHeight: 170,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 textPoppins(
//                   name: 'shoppzzy',
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                   fontsize: 25,
//                   fontweight: FontWeight.w700,
//                 ),
//                 const SizedBox(width: 12),
//                 const Icon(
//                   Icons.shopping_bag,
//                   color: Color.fromARGB(255, 8, 9, 9),
//                 )
//               ],
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 50,
//               child: searchTextFormField(
//                 onChanged: (value) => productProvider
//                     .search(productProvider.searchController.text),
//                 controller: productProvider.searchController,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const WishListPage()));
//             },
//             icon: const Padding(
//               padding: EdgeInsets.only(top: 20, right: 20, left: 30),
//               child: Icon(Icons.favorite_border_outlined),
//             ),
//             iconSize: 30,
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 180, top: 20),
//                   child: textPoppins(
//                     name: 'Browse Categories',
//                     fontsize: 15,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: InkWell(
//                     onTap: () {
//                       // Add your action here
//                     },
//                     child: const Text(
//                       'See all',
//                       style: TextStyle(
//                         fontSize: 15,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             // child: SizedBox(
//             //   height: 50.0,
//             //   child: ListView.builder(
//             //     scrollDirection: Axis.horizontal,
//             //     itemCount: categories.length,
//             //     itemBuilder: (BuildContext context, int index) {
//                   // return Padding(
//                   //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   //   child: CircleAvatar(
//                   //     radius: 25.0,
//                   //     backgroundImage: AssetImage(categories[index]['image']),
//                   //     backgroundColor: Colors.white,
//                   //     //  child: Text(categories[index]['name']),
//                   //   ),
//                   // );
//             //     },
//             //   ),
//             // ),
//           ),
//           //  Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 10),
//           //   child: Row(
//           //     children: categories.map((category) {
//           //       return Padding(
//           //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           //         child: Text(category['name']),
//           //       );
//           //     }).toList(),
//           //   ),
//           // ),
//           const SizedBox(height: 10),

//           const Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'my products',
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: Consumer<ProductProvider>(
//               builder: (context, productValue, child) {
//                 if (productValue.isLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (productValue.searchList.isEmpty &&
//                     productValue.searchController.text.isNotEmpty) {
//                   return Center(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                         children: [
//                           Image.asset('assets/serch empty.jpg'),
//                           textPoppins(
//                               name: 'SEARCHED PRODUCTS IS NOT AVAILABLE'),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else if (productValue.searchList.isEmpty) {
//                   if (productValue.allProductList.isNotEmpty) {
//                     final allProduct = productValue.allProductList;
//                     return GridView.builder(
//                       gridDelegate: gridDelegate(size.width * 0.0018),
//                       itemCount: allProduct.length,
//                       itemBuilder: (context, index) {
//                         final products = allProduct[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DetailsPage(products: products,
//                                 //  products.name,
//                                 //   description: products.description,
//                                 //   location: products.location,
//                                 //   price: products.price,
//                                 //   image:
//                                 //       NetworkImage(products.image.toString()),
//                                 //   category: products.brand,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: HomeContainer(
//                             value: productProvider,
//                             product: products,
//                           ),
//                         );
//                       },
//                     );
//                   } else {
//                     return Center(
//                       child: textAbel(
//                         name: ' No product Added',
//                         fontsize: 20,
//                         fontweight: FontWeight.w700,
//                       ),
//                     );
//                   }
//                 } else {
//                   return GridView.builder(
//                     gridDelegate: gridDelegate(size.width * 0.0018),
//                     itemCount: productValue.searchList.length,
//                     itemBuilder: (context, index) {
//                       final product = productValue.searchList[index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailsPage(products: product,),
//                             ),
//                           );
//                         },
//                         child: HomeContainer(
//                           value: productProvider,
//                           product: product,
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
import 'package:olx_app_firebase/view/home/widget/homewidget.dart';
import 'package:olx_app_firebase/view/home/widget/widget_home.dart';
import 'package:olx_app_firebase/view/productpage/product_page.dart';
import 'package:olx_app_firebase/view/screens/product_details_page.dart';
import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    Provider.of<ProductProvider>(context, listen: false).getAllProduct();
    Provider.of<AuthenticationProvider>(context, listen: false);

    // final List<String> specialProduct = [
    //   'assets/images/offer 1.jpg',
    //   'assets/images/offer 2.jpg',
    //   'assets/images/offer 3.jpg'
    // ];

    final List<String> catorgoryName = [
     'T-Shirt', 
    'Jewellery', 
    'Dress', 
    'Jackets',
    'Shoes', 
    'Bag'
  ];

    final List<String> categoryItems = [
      'assets/T-shirtt_img.jpg',
      'assets/jewllry.jpg',
      'assets/dress__img.jpg',
      'assets/jackets_img.jpg',
      'assets/shoes_img.jpg',
      'assets/bag_img.jpg',
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 242, 244),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textPoppins(
                  name: 'shoppzzy',
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontsize: 25,
                  fontweight: FontWeight.w700,
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.shopping_bag,
                  color: Color.fromARGB(255, 8, 9, 9),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: searchTextFormField(
                 onChanged: (value) => productProvider
                    .search(productProvider.searchController.text),
                controller: productProvider.searchController,
               
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WishListPage()));
            },
            icon: const Padding(
              padding: EdgeInsets.only(top: 20, right: 20, left: 30),
              child: Icon(Icons.favorite_border_outlined),
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 20),
                  child: textPoppins(
                    name: 'Browse Categories',
                    fontsize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProductPage()));//dd your action here
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categoryItems.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    right: 8,
                  ),
                  child: HomeWidgets().categoryItems(context, size,
                      category: catorgoryName[index],
                      imagePath: categoryItems[index]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // const Padding(
          //   padding: EdgeInsets.all(5.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Special Products',
          //         style: TextStyle(
          //           fontSize: 15,
          //           color: Colors.black,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 150,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: specialProduct.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8),
          //         child: Image.asset(specialProduct[index]),
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Products',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, productValue, child) {
                if (productValue.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (productValue.searchList.isEmpty &&
                    productValue.searchController.text.isNotEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Image.asset('assets/serch empty.jpg'),
                          textPoppins(
                              name: 'SEARCHED PRODUCTS IS NOT AVAILABLE'),
                        ],
                      ),
                    ),
                  );
                } else if (productValue.searchList.isEmpty) {
                  if (productValue.allProductList.isNotEmpty) {
                    final allProduct = productValue.allProductList;
                    return GridView.builder(
                      gridDelegate: gridDelegate(size.width * 0.0018),
                      itemCount: allProduct.length,
                      itemBuilder: (context, index) {
                        final products = allProduct[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(products: products,
                                //  products.name,
                                //   description: products.description,
                                //   location: products.location,
                                //   price: products.price,
                                //   image:
                                //       NetworkImage(products.image.toString()),
                                //   category: products.brand,
                                ),
                              ),
                            );
                          },
                          child: HomeContainer(
                            value: productProvider,
                            product: products,
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: textAbel(
                        name: ' No product Added',
                        fontsize: 20,
                        fontweight: FontWeight.w700,
                      ),
                    );
                  }
                } else {
                  return GridView.builder(
                    gridDelegate: gridDelegate(size.width * 0.0018),
                    itemCount: productValue.searchList.length,
                    itemBuilder: (context, index) {
                      final product = productValue.searchList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(products: product,),
                            ),
                          );
                        },
                        child: HomeContainer(
                          value: productProvider,
                          product: product,
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

