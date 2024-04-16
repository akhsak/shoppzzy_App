// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/view/authontication_screen.dart/login_screen.dart';
// import 'package:olx_app_firebase/view/authontication_screen.dart/signup_page.dart';
// import 'package:olx_app_firebase/widgets/text_style.dart';

// class SelectLoginScreen extends StatelessWidget {
//   const SelectLoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: textPoppins(name: 'Select', fontweight: FontWeight.bold),
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: size.height * .05, horizontal: size.width * .1),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 30), // Add space
//                 Container(
                   
//                     ),
//                 Image.asset('assets/Free Vector.jpg'),
//                 const Text(
//                   "Hello", // Add Hello text
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10), // Add space
//                 const Text(
//                   "Welcome to our app. Please select your option below:", // Add additional text
//                   style: TextStyle(fontSize: 16),
//                 ),
               
//                 const SizedBox(height: 30), // Add space
//                 ElevatedButton(
                  
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.black, // text color
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginScreen(),
//                       ),
//                     );
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.account_circle_outlined,
//                           size: 30,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Login',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20), // Add space
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.black, // text color
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             SignUpScreen(), // Navigate to SignUpScreen
//                       ),
//                     );
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.person_add_outlined,
//                           size: 20,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'SignUp',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/login_screen.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/signup_page.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({Key? key}) : super(key: key);

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
                Container(),
                Image.asset('assets/Free Vector.jpg'),
                const Text(
                  "Hello", // Add Hello text
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 10), // Add space
                const Text(
                  "Welcome to our app. Please select your option below:", // Add additional text
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 30), // Add space
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black), // Add black border
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
                          color: Colors.black, // Change icon color to black
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add space
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black), // Add black border
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
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
                          color: Colors.black, // Change icon color to black
                        ),
                        SizedBox(width: 10),
                        Text(
                          'SignUp',
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
