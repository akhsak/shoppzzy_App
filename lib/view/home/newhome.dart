import 'package:flutter/foundation.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/view/home/widget/homecontainer.dart';
import 'package:olx_app_firebase/view/screens/details_page.dart';
import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

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
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        
       // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 241, 242, 244),
        toolbarHeight: 170,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  textPoppins(
          //           name: 'Find Your Perfect',
          //           color: const Color(0xFFCADCFC),
          //           fontsize: 25,
          //           fontweight: FontWeight.w700),
            Row(
              children: [
                textPoppins(
                    name: 'shopping',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontsize: 25,
                    fontweight: FontWeight.w700),
                const SizedBox(width: 12),
                const Icon(
                  Icons.shopping_bag,
                  color: Color.fromARGB(255, 8, 9, 9),
                )
              ],
              
            ),
            const SizedBox(height: 10),
            searchTextFormField(
                onChanged: (value) =>
                    productProvider.search(productProvider.searchController.text),
                controller: productProvider.searchController),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListPage()));
          }, icon: Padding(
            padding: const EdgeInsets.only(top: 20,right: 20,left: 30),
            child: Icon(Icons.favorite_border_outlined),
          ),iconSize:30,),
        ],
        // IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
      ),
      body:
      
       Container(
         child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<ProductProvider>(
                  builder: (context, productValue, child) {
                    if (productValue.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (productValue.searchList.isEmpty &&
                        productValue.searchController.text.isNotEmpty) {
                      return Center(
                          child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Lottie.asset('assets/no available cars.json'),
                              textPoppins(name: 'SEARCHED CAR IS NOT AVAILABLE')
                            ],
                          ),
                        ),
                      ));
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
                                      category: products.category,
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
                              fontweight: FontWeight.w700),
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
                                    builder: (context) =>
                                        const DetailsPage(),
                                  ),
                                );
                              },
                              child: HomeContainer(
                                value: productProvider,
                                product: car,
                              ));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
               ),
       ),
      // floatingActionButton: authProvider.isAdminHome
      //     ? FloatingActionButton.extended(
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const AdminAddDataScreen()));
      //         },
      //         label: textPoppins(
      //             name: 'ADD CAR',
      //             color: const Color(0xFFCADCFC),
      //             fontweight: FontWeight.w700),
      //         backgroundColor: const Color(0xFF00246B),
      //       )
      //     : null,
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
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
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