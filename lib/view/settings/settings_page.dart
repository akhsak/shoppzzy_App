
// // // ignore_for_file: use_key_in_widget_constructors

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:olx_app_firebase/controller/authontication_provider.dart';
// // import 'package:olx_app_firebase/controller/bottom_provider.dart';
// // import 'package:olx_app_firebase/controller/user_provider.dart';
// // import 'package:olx_app_firebase/model/product_model.dart';
// // import 'package:olx_app_firebase/model/user_model.dart';
// // import 'package:olx_app_firebase/view/profile_Page/profile.dart';
// // import 'package:olx_app_firebase/view/screens/userdetails.dart';
// // import 'package:olx_app_firebase/view/select_loginScreen.dart';
// // import 'package:olx_app_firebase/view/settings/appinfo.dart';
// // import 'package:olx_app_firebase/view/settings/help.dart';
// // import 'package:olx_app_firebase/view/settings/wiget_settings/screen_widget.dart';
// // import 'package:olx_app_firebase/widgets/normal_widget.dart';
// // import 'package:olx_app_firebase/widgets/text_style.dart';
// // import 'package:provider/provider.dart';

// // class SettingsPage extends StatelessWidget {
// //    SettingsPage({Key? key});

// //   String? username;
// //   String? email;

// //   @override
// //   Widget build(BuildContext context) {
// //     final authProvider =
// //         Provider.of<AuthenticationProvider>(context, listen: false);
// //     final bottomProvider = Provider.of<WidgetProvider>(context, listen: false);
// //     Size size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       body: 
// //        Consumer<UserProvider>(builder: (context, userProvide, child) {
// //               final currentUser = FirebaseAuth.instance.currentUser;
// //               final uId = currentUser?.uid;
// //               UserModel? userData = userProvide.getCurrentUserData(uId);
// //               return Row(
// //                 children: [
// //                   CircleAvatar(
// //                     backgroundImage: userData!.profilePic != null
// //                         ? NetworkImage(userData.profilePic.toString())
// //                         : AssetImage('assets/profile_icon.jpg')
// //                             as ImageProvider,
// //                     radius: 50,
// //                     backgroundColor: Colors.white,
// //                   ), SizedBox(
// //                     width: size.width * .03,
// //                   ),
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       SizedBox(
// //                         width: size.width * .45,
// //                         child: Text(
// //                           userData.name!.isEmpty
// //                               ? 'Uknown name'
// //                               : userData.name.toString(),
// //                           style: GoogleFonts.montserrat(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: size.width * .05,
// //                           ),
// //                         ),
// //                       ),
// //                       Text(
// //                         userData.phoneNumber ?? '',
// //                         style: GoogleFonts.montserrat(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: size.width * .03,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
                 
// //                 Padding(
// //         padding: EdgeInsets.only(
// //             top: size.height * .08,
// //             left: size.width * .04,
// //             right: size.width * .04),
// //         child: SingleChildScrollView(
// //           scrollDirection: Axis.vertical,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               textPoppins(
// //                 name: 'Settings',
// //                 fontsize: 25,
// //                 fontweight: FontWeight.w600,
// //               ),
// //               const SizedBox(height: 10),
// //               SizedBox(
// //                 height: size.height * .30,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [ buildSettingItem(
// //                       context,
// //                       icon: Icons.people_alt_outlined,
// //                       onTap: () {
// //                         Navigator.push(context,MaterialPageRoute(builder: (context)=>UserDetailsPage(products: ProductModel(),)));
// //                         // Add logic for handling App Info
// //                       },
// //                       title: 'Profile',
// //                     ),
// //                     // App Info
// //                     buildSettingItem(
// //                       context,
// //                       icon: Icons.info_outline,
// //                       onTap: () {
// //                         Navigator.push(context,MaterialPageRoute(builder: (context)=>AppinfoPage()));
// //                         // Add logic for handling App Info
// //                       },
// //                       title: 'App Info',
// //                     ),
// //                     // Help Center
// //                     buildSettingItem(
// //                       context,
// //                       icon: Icons.help_outline,
// //                       onTap: () {
// //                    Navigator.push(context,MaterialPageRoute(builder: (context)=>HelpPage()));

// //                         // Add logic for handling Help Center
// //                       },
// //                       title: 'Help Center',
// //                     ),
                    
// //                     // Log Out
// //                     buildSettingItem(
// //                       context,
// //                       icon: Icons.exit_to_app_outlined,
// //                       onTap: () {
// //                         alertSheet(context,
// //                             alertMessage: 'ARE YOU SURE TO LOGOUT ?',
// //                             onPressed: () {
// //                               authProvider.googleSignOut();
// //                               authProvider.logOut();
// //                               Navigator.pushAndRemoveUntil(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => const SelectLoginScreen(),
// //                                 ),
// //                                 (route) => false,
// //                               );
// //                               bottomProvider.currentIndex = 0;
// //                             },
// //                             confirmButtonLabel: 'LOGOUT');
// //                       },
// //                       title: 'Log Out',
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/controller/user_provider.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/view/screens/userdetails.dart';
import 'package:olx_app_firebase/view/select_loginscreen.dart';
import 'package:olx_app_firebase/view/settings/appinfo.dart';
import 'package:olx_app_firebase/view/settings/help.dart';
import 'package:olx_app_firebase/view/settings/wiget_settings/screen_widget.dart';
import 'package:olx_app_firebase/widgets/normal_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    final bottomProvider = Provider.of<WidgetProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final currentUser = FirebaseAuth.instance.currentUser;
          final uId = currentUser?.uid;
          final userData = userProvider.getCurrentUserData(uId);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: userData!.profilePic != null
                      ? NetworkImage(userData.profilePic.toString())
                      : const AssetImage('assets/profile_icon.jpg') as ImageProvider,
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  userData.name!.isEmpty ? 'Unknown name' : userData.name.toString(),
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  userData.phoneNumber ?? '',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.03,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Column(
                  children: [
                    buildSettingItem(
                      context,
                      icon: Icons.people_alt_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsPage(products: ProductModel()),
                          ),
                        );
                      },
                      title: 'Profile',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.info_outline,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppinfoPage(),
                          ),
                        );
                      },
                      title: 'App Info',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.help_outline,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpPage(),
                          ),
                        );
                      },
                      title: 'Help Center',
                    ),
                    buildSettingItem(
                      context,
                      icon: Icons.exit_to_app_outlined,
                      onTap: () {
                        alertSheet(
                          context,
                          alertMessage: 'ARE YOU SURE TO LOGOUT ?',
                          onPressed: () {
                            authProvider.googleSignOut();
                            authProvider.logOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectLoginScreen(),
                              ),
                              (route) => false,
                            );
                            bottomProvider.currentIndex = 0;
                          },
                          confirmButtonLabel: 'LOGOUT',
                        );
                      },
                      title: 'Log Out',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
