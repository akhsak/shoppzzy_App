


import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/home/widget/home_widget.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                const Padding(
                  padding: EdgeInsets.only(top: 75, left: 15),
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
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'my products',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/6fbc21e09012154395ce7ceef40d451e.jpg',
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'shirt',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Essential mens shirt'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
