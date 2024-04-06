

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
import 'package:olx_app_firebase/view/screens/details_page.dart';
import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = [
    {'name': 'T-Shirt', 'image': 'assets/T-shirtt_img.jpg'},
    {'name': 'Pants', 'image': 'assets/pants_img.jpg'},
    {'name': 'Dress', 'image': 'assets/dress__img.jpg'},
    {'name': 'Jackets', 'image': 'assets/jackets_img.jpg'},
    {'name': 'Shoes', 'image': 'assets/shoes_img.jpg'},
    {'name': 'Bag', 'image': 'assets/bag_img.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    Provider.of<ProductProvider>(context, listen: false).getAllCar();
    Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 242, 244),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textPoppins(
                  name: 'shoppzzy',
                  color: Color.fromARGB(255, 0, 0, 0),
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
            searchTextFormField(
              onChanged: (value) => productProvider.search(productProvider.searchController.text),
              controller: productProvider.searchController,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WishListPage()));
            },
            icon: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 30),
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(categories[index]['image']),
                      backgroundColor: Colors.white,
                      
                     // child: Text(categories[index]['name']),
                    ),
                  );
                  
                },
              ),
            ),
          ),
          //  Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     children: categories.map((category) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //         child: Text(category['name']),
          //       );
          //     }).toList(),
          //   ),
          // ),
          const SizedBox(height: 10),
          
             const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'my products',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          const SizedBox(height: 10),
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
                          textPoppins(name: 'SEARCHED PRODUCTS IS NOT AVAILABLE'),
                        ],
                      ),
                    ),
                  );
                } else if (productValue.searchList.isEmpty) {
                  if (productValue.allCarList.isNotEmpty) {
                    final allCar = productValue.allCarList;
                    return GridView.builder(
                      gridDelegate: gridDelegate(size.width * 0.0018),
                      itemCount: allCar.length,
                      itemBuilder: (context, index) {
                        final products = allCar[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  name: products.name,
                                  description: products.description,
                                  location: products.location,
                                  price: products.price,
                                  image: NetworkImage(products.image.toString()),
                                  category: products.brand,
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
                      final car = productValue.searchList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DetailsPage(),
                            ),
                          );
                        },
                        child: HomeContainer(
                          value: productProvider,
                          product: car,
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

Widget searchTextFormField({controller, onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    controller: controller,
    style: const TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
    decoration: InputDecoration(
      hintText: 'Search...',
      hintStyle: const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 2, 2, 3)),
       // borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
       // borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
       // borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: const Icon(
        Icons.search,
        color: Color.fromARGB(255, 6, 6, 6),
      ),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}

