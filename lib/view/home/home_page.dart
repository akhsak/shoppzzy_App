import 'package:flutter/material.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class HomePage extends StatelessWidget {
  HomePage({Key}) : super();

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
                  padding: EdgeInsets.only(top: 80, left: 18),
                  child: Container(
                    height: 50,
                    width: 330,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'search...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75, left: 15),
                  child: Icon(Icons.shopping_bag_outlined),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                    return _buildCategoryCard(
                        categories[index]['name'], categories[index]['image']);
                  },
                ),
              ),
            ),
            Container(
              height: 100,
              width: 410,
              color: Colors.white,
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         CircleAvatar(
              //           radius: 30,
              //           backgroundImage: AssetImage('assets/your_image.png'),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
