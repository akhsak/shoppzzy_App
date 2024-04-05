
import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/authontication.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 1,
            width: size.width * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome.jpg',),
                
                
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 25,
            right: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to OLX',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 16, 15, 15),
                  ),
                ),
                Text(
                  'Ecommerce application',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 8, 8, 8),
                  ),
                ),
              ],
            ),
          ),
         
          Positioned(
           bottom: 180,
           height: 50,
           left: 100,
            right: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthenticationNavigate(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 7, 7),
              ),
              child: const Text(
                'Let\'s Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
