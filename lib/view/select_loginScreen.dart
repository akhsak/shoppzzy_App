import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/login_screen.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/signup_page.dart';

import 'package:olx_app_firebase/widgets/text_style.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: textPoppins(name: 'Select', fontweight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * .05, horizontal: size.width * .1),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30), // Add space
                Container(
                    // height: size.height * 1,
                    // width: size.width * 1,
                    // decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage('assets/welcome.jpg'),
                    //         fit:BoxFit.contain)),
                    ),
                Image.asset('assets/Free Vector.jpg'),
                const Text(
                  "Hello", // Add Hello text
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10), // Add space
                const Text(
                  "Welcome to our app. Please select your option below:", // Add additional text
                  style: TextStyle(fontSize: 16),
                ),
                // SizedBox(height: 30), // Add space
                // Image.asset('assets/select_img.jpg'),
                const SizedBox(height: 30), // Add space
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // text color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add space
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // text color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignUpScreen(), // Navigate to SignUpScreen
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person_add_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
