
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/view/select_loginScreen.dart';
import 'package:olx_app_firebase/view/settings/appinfo.dart';
import 'package:olx_app_firebase/view/settings/help.dart';
import 'package:olx_app_firebase/view/settings/wiget_settings/screen_widget.dart';
import 'package:olx_app_firebase/widgets/normal_widget.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final bottomProvider = Provider.of<WidgetProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * .08,
            left: size.width * .04,
            right: size.width * .04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textPoppins(
                name: 'Settings',
                fontsize: 25,
                fontweight: FontWeight.w600,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * .35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // App Info
                    buildSettingItem(
                      context,
                      icon: Icons.info_outline,
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AppinfoPage()));
                        // Add logic for handling App Info
                      },
                      title: 'App Info',
                    ),
                    // Help Center
                    buildSettingItem(
                      context,
                      icon: Icons.help_outline,
                      onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>HelpPage()));

                        // Add logic for handling Help Center
                      },
                      title: 'Help Center',
                    ),
                    
                    // Log Out
                    buildSettingItem(
                      context,
                      icon: Icons.exit_to_app_outlined,
                      onTap: () {
                        alertSheet(context,
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
                            confirmButtonLabel: 'LOGOUT');
                      },
                      title: 'Log Out',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

