// ignore_for_file: must_be_immutable, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/user_provider.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/view/screens/profile.dart';
import 'package:provider/provider.dart';

class ContactSellerPage extends StatelessWidget {
  String uId;
  ContactSellerPage({required this.uId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getuserProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    getuserProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact  "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<UserProvider>(
          builder: (context, userProvide, child) {
            UserModel? userData = userProvide.getCurrentUserData(uId);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: userData!.profilePic != null
                        ? NetworkImage(userData.profilePic.toString())
                        : AssetImage('assets/icons/profile icons.png')
                            as ImageProvider,
                    radius: 70,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Text(
                  "Contact Information",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * .035,
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                ProfileWidgets().textdBox(
                  context,
                  size,
                  userData.name,
                  'Name',
                ),
                ProfileWidgets().textdBox(
                  context,
                  size,
                  "+91 ${userData.phoneNumber}",
                  'Phone',
                  iconData:Icons.call,
                  onTap: () => launchPhone(userData.phoneNumber.toString()),
                ),
                ProfileWidgets().textdBox(
                  context,
                  size,
                  userData.email,
                  'Email',
                  iconData: Icons.email_outlined,
                  onTap: () {
                    launchEmail(userData.email.toString());
                  },
                ),
                ProfileWidgets()
                    .textdBox(context, size, userData.address, 'Address'),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  void launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    // if (await canLaunch(emailLaunchUri.toString())) {
    //   await launch(emailLaunchUri.toString());
    // } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  void launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    // if (await canLaunch(phoneLaunchUri.toString())) {
    //   await launch(phoneLaunchUri.toString());
    // } else {
    //   throw 'Could not launch $phoneLaunchUri';
    // }
 // }
}
