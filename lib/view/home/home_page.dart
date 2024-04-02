import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/home/widget/home_widget.dart';
import 'package:olx_app_firebase/view/screens/details_page.dart';
import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Dummy data for categories
  final List<Map<String, dynamic>> categories = [
    {'name': 'T-Shirt', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Jackets', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Pants', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Dress', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Shoes', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Shoes', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Shoes', 'image': 'assets/welcome_cart.jpg'},
    {'name': 'Shoes', 'image': 'assets/welcome_cart.jpg'},
  ];

  final List<Map<String, dynamic>> images = [
    {'name': 'T-Shirt', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Jackets', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Pants', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Dress', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'T-Shirt', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Jackets', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Pants', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
    {'name': 'Dress', 'image': 'assets/6fbc21e09012154395ce7ceef40d451e.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 18),
                  child: SizedBox(
                    height: 50,
                    width: 330,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'search...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75, left: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WishlistPage()));
                    },
                    child: const Icon(Icons.favorite_border_outlined,size: 30,),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 180, top: 20),
                  child: textPoppins(
                    name: 'Browse Categories',
                    fontsize: 15,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 15, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildCategoryCard(
                      title: categories[index]['name'],
                      imagePath: categories[index]['image'],
                    );
                  },
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                children: [
                  //const SizedBox(height: 5),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailsPage()));
                        },
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 155,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        images[index]['image'],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    // borderRadius: BorderRadius.circular(10), // Add border radius
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'shirt',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('Essential mens shirt'),
                                      Row(
                                        children: [
                                          Icon(Icons.currency_rupee),
                                          Text(
                                            '1,100',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle favorite button tap
                                },
                                child: const Icon(Icons.favorite_outline_outlined),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
