import 'package:flutter/material.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/authontication.dart';
import 'package:olx_app_firebase/widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                    image: AssetImage('assets/welcome_cart.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
            top: 100,
            left: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // textPoppins(
                //     name: 'olxx',
                //     fontsize: 25,
                //     fontweight: FontWeight.w600,
                //     color: const Color.fromARGB(255, 16, 15, 15)),
                // textAbel(
                //     name: ' ecommerece application ',
                //     color: const Color.fromARGB(255, 8, 8, 8),
                //     fontsize: 17,
                //     fontweight: FontWeight.w600),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 15,
              right: 15,
              child: ButtonWidgets().rectangleButton(size,
                  name: 'Lets Start',
                  bgColor: Color.fromARGB(255, 38, 17, 111),
                  fgColor: const Color.fromARGB(255, 228, 222, 222),
                  onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>const AuthenticationNavigate()));
              }))
        ],
      ),
    );
  }
}
