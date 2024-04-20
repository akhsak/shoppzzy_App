import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/authontication.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome-screen_olx.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: 25,
            right: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Shopzzy',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Ultimate Shopping Destination',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationNavigate(),
                      ),
                    );
                  },
                  child: Text(
                    'Let\'s Start',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 3, 3, 3),
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationNavigate(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: const Color.fromARGB(255, 7, 7, 7),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
