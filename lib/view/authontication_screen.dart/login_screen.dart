// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/register_page.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/widgets/login_widgtets.dart';
import 'package:olx_app_firebase/widgets/bottom_screen.dart';
import 'package:olx_app_firebase/widgets/button_widget.dart';
import 'package:olx_app_firebase/widgets/snackbar_widget.dart';
import 'package:olx_app_firebase/widgets/text_formfield.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            authProvider.clearLoginControllers();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .0001, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/RoadWay.png'),
              SizedBox(
                height: size.height * 0.5,
                child: Form(
                  key: authProvider.loginFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: authProvider.loginEmailController,
                        validateMsg: 'Enter Your E-mail',
                      ),
                      Consumer<AuthenticationProvider>(
                        builder: (context, value, child) => CustomTextFormField(
                          labelText: 'Password',
                          controller: authProvider.loginPasswordController,
                          obscureText: value.obscureText,
                          validateMsg: 'Enter Your Password',
                          suffixIcon: IconButton(
                            icon: Icon(value.obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            onPressed: () {
                              value.obscureChange();
                            },
                          ),
                        ),
                      ),
                      ButtonWidgets().rectangleButton(size, name: 'L O G I N',
                          onPressed: () async {
                        if (authProvider.loginFormkey.currentState!
                            .validate()) {
                          try 
                           {
                            
                            await authProvider.loginUser(
                                authProvider.loginEmailController.text,
                                authProvider.loginPasswordController.text);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomScreen()),
                                (route) => false);
                            SnackBarWidget().showSuccessSnackbar(
                                context, 'login successfull');
                            authProvider.clearLoginControllers();
                          } catch (e) {
                            SnackBarWidget().showErrorSnackbar(
                                context, 'Email or Password is incorrect');
                          }
                        }
                      },
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 3)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            const Flexible(child: Divider(thickness: 1.5)),
                            textPoppins(name: '  or Login with  '),
                            const Flexible(child: Divider(thickness: 1.5))
                          ],
                        ),
                      ),
                      LoginWidgets().loginIcons(context)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPoppins(name: "Don't have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                      authProvider.clearLoginControllers();
                    },
                    child: textAbel(
                        name: 'Register Now',
                        color: Colors.blueAccent[400],
                        fontsize: 17,
                        fontweight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}