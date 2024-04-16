import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/user_provider.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/view/screens/creatuser.dart';
import 'package:olx_app_firebase/view/profile_Page/profile.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({Key? key, required ProductModel products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getuserProvider = Provider.of<UserProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    getuserProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<UserProvider>(
          builder: (context, userProvide, child) {
            final currentUser = FirebaseAuth.instance.currentUser;
            final uId = currentUser?.uid;
            UserModel? userData = userProvide.getCurrentUserData(uId);

            return userData!.name!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: userData.profilePic != null
                              ? NetworkImage(userData.profilePic.toString())
                              : AssetImage('assets/profile_icon.jpg')
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
                      ProfileWidgets().textdBox(context, size,
                          "+91 ${userData.phoneNumber}", 'Phone'),
                      ProfileWidgets()
                          .textdBox(context, size, userData.email, 'Email'),
                      ProfileWidgets()
                          .textdBox(context, size, userData.address, 'Address'),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_add,
                        size: size.width * .2,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome! Create your profile to get started.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateUserDetails(),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Create Your Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

