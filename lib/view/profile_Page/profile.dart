// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:olx_app_firebase/controller/user_provider.dart';
// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/model/user_model.dart';
// import 'package:olx_app_firebase/view/addpage/widgets/widget_tab.dart';
// import 'package:olx_app_firebase/view/screens/details_page.dart';
// import 'package:olx_app_firebase/view/screens/userdetails.dart';
// import 'package:olx_app_firebase/view/settings/settings_page.dart';
// import 'package:olx_app_firebase/widgets/text_style.dart';
// import 'package:provider/provider.dart';

// class ProfilePage extends StatelessWidget {
//   ProfilePage({super.key});

//   final List listTitles = [
//     'my Profile',
//     'my Products',
//     'Wishlist',
//     'Help Center',
//   ];

//   final List listSubTitles = [
//     'Make Your Profile',
//     'Active Ads & InActive Ads',
//     'You have 2 cards',
//     'FAQ, Contact, Privacy & Terms',
//   ];

//   final List<Widget> listTabs = [
//    // UserDetailsPage(),
//     UserDetailsPage(products: ProductModel(),),
//    // MyProductTab(),
//    // WishlistPage(),
//   //  SettingsPage(),
//   ];

//   String? username;
//   String? email;
  
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.login_outlined))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
//         child: Column(
//           children: [
//             Consumer<UserProvider>(builder: (context, userProvide, child) {
//               final currentUser = FirebaseAuth.instance.currentUser;
//               final uId = currentUser?.uid;
//               UserModel? userData = userProvide.getCurrentUserData(uId);
//               return Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: userData!.profilePic != null
//                         ? NetworkImage(userData.profilePic.toString())
//                         : AssetImage('assets/profile_icon.jpg')
//                             as ImageProvider,
//                     radius: 50,
//                     backgroundColor: Colors.white,
//                   ),
//                   SizedBox(
//                     width: size.width * .03,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: size.width * .45,
//                         child: Text(
//                           userData.name!.isEmpty
//                               ? 'Uknown name'
//                               : userData.name.toString(),
//                           style: GoogleFonts.montserrat(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.width * .05,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         userData.phoneNumber ?? '',
//                         style: GoogleFonts.montserrat(
//                           fontWeight: FontWeight.bold,
//                           fontSize: size.width * .03,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // IconsWidgets().IconButtonWidget(context, size,
//                   //     onPressed: () =>
//                   //         NavigatorWidget().push(context, UserDetailsPage()),
//                   //     iconData: EneftyIcons.edit_2_outline)
//                 ],
//               );
//             }),
//             SizedBox(
//               height: size.width * .1,
//             ),
//             Expanded(
//               child: ListView.separated(
//                 itemBuilder: (context, index) => Material(
//                   elevation: 20,
//                   shadowColor: const Color.fromARGB(48, 0, 0, 0),
//                   child: ListTile(
//                     onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => listTabs[index],
//                         )),
//                     title: Text(
//                       listTitles[index].toString().toUpperCase(),
//                       style: GoogleFonts.montserrat(
//                         fontWeight: FontWeight.w600,
//                         fontSize: size.width * .04,
//                       ),
//                     ),
//                     subtitle: Text(
//                       listSubTitles[index],
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: size.width * .03,
//                       ),
//                     ),
//                     trailing: Icon(Icons.arrow_forward_ios_outlined,
//                         size: size.width * 0.055),
//                   ),
//                 ),
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: size.width * .05,
//                 ),
//                 itemCount: listTabs.length,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
