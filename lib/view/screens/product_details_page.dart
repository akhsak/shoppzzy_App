

// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/provider_home.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/view/productpage/sell_product.dart';
import 'package:olx_app_firebase/view/settings/contactseller.dart';
import 'package:olx_app_firebase/widgets/button.dart';
import 'package:olx_app_firebase/widgets/icons.dart';
import 'package:olx_app_firebase/widgets/navigator.dart';
import 'package:olx_app_firebase/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel? products;
  ProductDetailsPage({super.key, required this.products});
  String? user;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy MMMM dd').format(products!.timeStamp!);

    getUser();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
          title: Text(''),
          backgroundColor: Color.fromARGB(255, 37, 157, 192),
          foregroundColor: Colors.white),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(products!.image.toString()),
                      fit: BoxFit.contain,
                    ),
                    color: Colors.transparent,
                  ),
                  width: double.infinity,
                  height: size.height * .4,
                ),
                const SizedBox(height: 20),
                TextWidgets().TitleText(
                  context,
                  text: products!.price != null
                      ? "₹ ${products!.price.toString()}"
                      : '₹ 0000',
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .7,
                      child: TextWidgets().TitleText(
                        context,
                        text: products!.title ?? 'Lorem Ipsum',
                      ),
                    ),
                    Consumer<ProductProvider>(
                      builder: (context, provider, child) {
                        bool isFavorite = provider.wishListCheck(products!);
                        return IconsWidgets().IconButtonWidget(
                          context,
                          size,
                          iconData: isFavorite
                              ? Icons.heart_broken_rounded
                              : Icons.heart_broken_outlined,
                          color: Colors.red,
                          onPressed: () async {
                            final value =
                                await provider.wishListCheck(products!);
                            provider.wishlistClicked(products!.id!, value);
                          },
                        );
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgets().SubtitleText(context, text: formattedDate),
                    TextWidgets().SubtitleText(context,
                        text: products!.location ?? 'Uknown Location'),
                  ],
                ),
                Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgets()
                        .BodyTextBold(context, text: "Brand".toUpperCase()),
                    TextWidgets().BodyText(
                      context,
                      text: products!.brand.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextWidgets().BodyTextBold(
                  context,
                  text: "Description",
                ),
                Text(
                  products!.description ??
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
                  style: TextStyle(fontSize: size.width * .037),
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: ButtonWidget().fullWidthElevatedButtonWithIcon(size,
              onPressed: () {
            if (products!.name != user) {
              NavigatorWidget().push(
                  context,
                  ContactSellerPage(
                    uId: products!.uId.toString(),
                  ));
            } else {
              Provider.of<ProductProvider>(context, listen: false).isEdit =
                  true;
              NavigatorWidget().push(
                context,
                SellProductPage(
                  products: products,
                ),
              );
            }
          },
              label: products!.name != user ? 'Contact' : 'Update',
              icon: products!.name != user
                  ? Icons.call_outlined
                  : Icons.edit_outlined),
        ),
      ),
    );
  }

  void getUser() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    user = currentUser.email ?? currentUser.phoneNumber;
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/controller/user_provider.dart';
// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/model/user_model.dart';
// import 'package:olx_app_firebase/view/screens/creatuser.dart';
// import 'package:olx_app_firebase/view/screens/profile.dart';
// import 'package:provider/provider.dart';

// class UserDetailsPage extends StatelessWidget {
//   UserDetailsPage({Key? key, required ProductModel products}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final getuserProvider = Provider.of<UserProvider>(context, listen: false);
//     Size size = MediaQuery.of(context).size;
//     getuserProvider.getUserData();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Profile"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Consumer<UserProvider>(
//           builder: (context, userProvide, child) {
//             final currentUser = FirebaseAuth.instance.currentUser;
//             final uId = currentUser?.uid;
//             UserModel? userData = userProvide.getCurrentUserData(uId);

//             return userData!.name!.isNotEmpty
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: CircleAvatar(
//                           backgroundImage: userData.profilePic != null
//                               ? NetworkImage(userData.profilePic.toString())
//                               : AssetImage('assets/profile_icon.jpg')
//                                   as ImageProvider,
//                           radius: 70,
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.width * .04,
//                       ),
//                       Text(
//                         "Contact Information",
//                         style: TextStyle(
//                           color: Colors.grey.shade800,
//                           fontWeight: FontWeight.w600,
//                           fontSize: size.width * .035,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.width * .04,
//                       ),
//                       ProfileWidgets().textdBox(
//                         context,
//                         size,
//                         userData.name,
//                         'Name',
//                       ),
//                       ProfileWidgets().textdBox(context, size,
//                           "+91 ${userData.phoneNumber}", 'Phone'),
//                       ProfileWidgets()
//                           .textdBox(context, size, userData.email, 'Email'),
//                       ProfileWidgets()
//                           .textdBox(context, size, userData.address, 'Address'),
//                     ],
//                   )
//                 : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.person_add,
//                         size: size.width * .2,
//                         color: Theme.of(context).primaryColor,
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         'Welcome! Create your profile to get started.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CreateUserDetails(),
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Theme.of(context).primaryColor,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 15,
//                             horizontal: 40,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: Text(
//                           'Create Your Profile',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }

