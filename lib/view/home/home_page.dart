// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/controller/provider_home.dart';
// import 'package:olx_app_firebase/view/home/widget/home_widget.dart';
// import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
// import 'package:olx_app_firebase/view/screens/details_page.dart';
// import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
// import 'package:olx_app_firebase/widgets/text_style.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   // Dummy data for categories
//   final List<Map<String, dynamic>> categories = [
//     {'name': 'T-Shirt', 'image': 'assets/T-shirtt_img.jpg'},
//     {'name': 'Pants', 'image': 'assets/pants_img.jpg'},
//     {'name': 'Dress', 'image': 'assets/dress__img.jpg'},
//     {'name': 'Jackets', 'image': 'assets/jackets_img.jpg'},
//     {'name': 'Shoes', 'image': 'assets/shoes_img.jpg'},
//     {'name': 'Bag', 'image': 'assets/bag_img.jpg'},
    
//   ];

//   final List<Map<String, dynamic>> images = [
//     {'name': 'T-Shirt', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Jackets', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Pants', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Dress', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'T-Shirt', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Jackets', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Pants', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//     {'name': 'Dress', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final prdctprovider=Provider.of<ProductProvider>(context,listen: false);
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 80, left: 18),
//                   child: SizedBox(
//                     height: 50,
//                     width: 330,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search),
//                           hintText: 'search...',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5))),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 75, left: 15),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const WishlistPage()));
//                     },
//                     child: const Icon(
//                       Icons.favorite_border_outlined,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 180, top: 20),
//                   child: textPoppins(
//                     name: 'Browse Categories',
//                     fontsize: 15,
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Text(
//                     'See all',
//                     style: TextStyle(
//                         fontSize: 15, decoration: TextDecoration.underline),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: SizedBox(
//                 height: 120,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return BuildCategoryCard(
//                       title: categories[index]['name'],
//                       imagePath: categories[index]['image'],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(5.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'my products',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 18, right: 18),
//               child: Column(
//                 children: [
//                   // //const SizedBox(height: 5),
//                   // GridView.builder(
//                   //   shrinkWrap: true,
//                   //   physics: const NeverScrollableScrollPhysics(),
//                   //   gridDelegate:
//                   //       const SliverGridDelegateWithFixedCrossAxisCount(
//                   //     crossAxisCount: 2,
//                   //     crossAxisSpacing: 10,
//                   //     mainAxisSpacing: 10,
//                   //     childAspectRatio: 0.75,
//                   //   ),
//                   //   itemCount: categories.length,
//                   //   itemBuilder: (BuildContext context, int index) {
//                   //     return GestureDetector(
//                   //       onTap: () {
//                   //         Navigator.push(
//                   //             context,
//                   //             MaterialPageRoute(
//                   //                 builder: (context) => const DetailsPage()));
//                   //       },
//                   //       child: Stack(
//                   //         children: [
//                   //           Column(
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: [
//                   //               Container(
//                   //                 height: 159,
//                   //                 decoration: BoxDecoration(
//                   //                   image: DecorationImage(
//                   //                     image: AssetImage(
//                   //                       images[index]['image'],
//                   //                     ),
//                   //                     fit: BoxFit.cover,
//                   //                   ),
//                   //                   // borderRadius: BorderRadius.circular(10), // Add border radius
//                   //                 ),
//                   //               ),
//                   //               const Padding(
//                   //                 padding: EdgeInsets.all(8.0),
//                   //                 child: Column(
//                   //                   crossAxisAlignment:
//                   //                       CrossAxisAlignment.start,
//                   //                   children: [
//                   //                     Text(
//                   //                       'shirt',
//                   //                       style: TextStyle(
//                   //                         color: Colors.grey,
//                   //                         fontWeight: FontWeight.bold,
//                   //                       ),
//                   //                     ),
//                   //                     Text('Essential mens shirt'),
//                   //                     Row(
//                   //                       children: [
//                   //                         Icon(Icons.currency_rupee),
//                   //                         Text(
//                   //                           '1,100',
//                   //                           style: TextStyle(
//                   //                               fontWeight: FontWeight.bold),
//                   //                         )
//                   //                       ],
//                   //                     )
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             ],
//                   //           ),
//                   //           Positioned(
//                   //             top: 5,
//                   //             right: 5,
//                   //             child: GestureDetector(
//                   //               onTap: () {
//                   //                 // Handle favorite button tap
//                   //               },
//                   //               child:
//                   //                   const Icon(Icons.favorite_outline_outlined),
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     );
//                   //   },
//                   // ),
                  
//                    Consumer<ProductProvider>(
//                      builder: (context, carValue, child) {
//                        if (carValue.isLoading) {
//                          return const Center(child: CircularProgressIndicator());
//                        } else if (carValue.searchList.isEmpty &&
//                            carValue.searchController.text.isNotEmpty) {
//                          return Center(
//                              child: Center(
//                            child: SingleChildScrollView(
//                              scrollDirection: Axis.vertical,
//                              child: Column(
//                                children: [
//                                  // Lottie.asset('assets/no available cars.json'),
//                                  textPoppins(name: 'SEARCHED CAR IS NOT AVAILABLE')
//                                ],
//                              ),
//                            ),
//                          ));
//                        } else if (carValue.searchList.isEmpty) {
//                          if (carValue.allCarList.isNotEmpty) {
//                            final allCar = carValue.allCarList;
//                            return GridView.builder(
//                              gridDelegate: gridDelegate(size.width * 0.0018),
//                              itemCount: allCar.length,
//                              itemBuilder: (context, index) {
//                                final cars = allCar[index];
//                                return GestureDetector(
//                                  onTap: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                        builder: (context) => DetailsPage(
//                                          // carName: cars.carName,
//                                          // description: cars.description,
//                                          // km: cars.km,
//                                          // price: cars.price,
//                                          // image: NetworkImage(cars.image.toString()),
//                                          // date: cars.date,
//                                        ),
//                                      ),
//                                    );
//                                  },
//                                  child: HomeCarContainer(
//                                    value: prdctprovider,
//                                    product: cars,
//                                  ),
//                                );
//                              },
//                            );
//                          } else {
//                            return Center(
//                              child: textAbel(
//                                  name: 'NO CARS ADDED',
//                                  fontsize: 20,
//                                  fontweight: FontWeight.w700),
//                            );
//                          }
//                        } else {
//                          return GridView.builder(
//                            gridDelegate: gridDelegate(size.width * 0.0018),
//                            itemCount: carValue.searchList.length,
//                            itemBuilder: (context, index) {
//                              final car = carValue.searchList[index];
                   
//                              return GestureDetector(
//                                  onTap: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                        builder: (context) =>
//                                            const DetailsPage(),
//                                      ),
//                                    );
//                                  },
//                                  child: HomeCarContainer(
//                                    value: prdctprovider,
//                                    product: car,
//                                  ));
//                            },
//                          );
//                        }
//                      },
//                    ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
//   return SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     mainAxisSpacing: 10,
//     crossAxisSpacing: 10,
//     childAspectRatio: childAspectRatio,
//   );
// }