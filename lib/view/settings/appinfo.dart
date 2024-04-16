// import 'package:flutter/material.dart';

// class AppinfoPage extends StatelessWidget {
//   const AppinfoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('App info'),),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:olx_app_firebase/view/settings/wiget_settings/screen_widget.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class AppinfoPage extends StatelessWidget {
  const AppinfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: size.width * .16,
                  ),
                  textPoppins(
                      name: 'Shopzzy',
                      color: const Color(0xFF00246B),
                      fontsize: 25,
                      fontweight: FontWeight.bold),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.shopping_bag,
                    color: Color(0xFF00246B),
                  )
                ],
              ),
              settingsTextPoppins(name: 'Description'),
              const SizedBox(height: 10.0),
              Text(
                  
                      'Shopzzy is a mobile application designed to provide users with a convenient platform for purchasing items. With a user-friendly interface and a wide selection of products, users can easily browse, search, and add product to their wishlist and contact Shopzzy.'),
              const SizedBox(height: 20.0),
              settingsTextPoppins(name: 'Key Features'),
              const SizedBox(height: 10.0),
              buildKeyFeature(
                  title: 'Browse and Search',
                  description:
                      'Users can browse through a vast collection of products categorized by make, model, or year. They can also search for specific products using keywords. '),
              buildKeyFeature(
                  title: 'Product Details',
                  description:
                      'Each Product listing includes detailed information such as Product name, product type, description, price, and cover image. Users can view these details to make informed purchasing decisions. '),
              buildKeyFeature(
                  title: 'Wishlist',
                  description:
                      ' Users can add Product to their wishlist. compare and review the Product before making a decision on which Product to purchase.'),
            ],
          ),
        ),
      ),
    );
  }
}