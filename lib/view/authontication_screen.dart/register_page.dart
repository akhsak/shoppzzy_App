// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/widgets/bottom_screen.dart';
import 'package:olx_app_firebase/widgets/button_widget.dart';
import 'package:olx_app_firebase/widgets/snackbar_widget.dart';
import 'package:olx_app_firebase/widgets/text_formfield.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  bool isLoading = false;
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .07, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        authProvider.clearRegisterControllers();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  SizedBox(width: size.width * .07),
                  textPoppins(
                    name: 'olx Register',
                    fontsize: 25,
                    fontweight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: size.height * .1),
              SizedBox(
                height: size.height * .5,
                child: Form(
                  key: authProvider.registerFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: authProvider.registerEmailController,
                        validateMsg: 'Enter a Email',
                      ),
                      Consumer<AuthenticationProvider>(
                          builder: (context, value, child) {
                        return Column(
                          children: [
                            CustomTextFormField(
                              labelText: 'Password',
                              controller:
                                  authProvider.registerPasswordController,
                              validateMsg: 'Enter a New Password',
                              obscureText: value.obscureText,
                              suffixIcon: IconButton(
                                icon: Icon(value.obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined),
                                onPressed: () {
                                  value.obscureChange();
                                },
                              ),
                            ),
                            SizedBox(height: size.height * .035),
                            CustomTextFormField(
                              labelText: 'Confirm password',
                              controller:
                                  authProvider.confirmPasswordController,
                              obscureText: value.obscureText,
                              validateMsg: 'Re-Enter Your Password',
                            ),
                          ],
                        );
                      }),
                      ButtonWidgets().rectangleButton(
                        size,
                        name: 'Register',
                        onPressed: () async {
                          if (authProvider.registerFormkey.currentState!
                              .validate()) {
                            try {
                              if (authProvider
                                      .registerPasswordController.text ==
                                  authProvider.confirmPasswordController.text) {
                                await authProvider.registerUser(
                                    authProvider.registerEmailController.text,
                                    authProvider
                                        .registerPasswordController.text);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomScreen()));

                                authProvider.clearRegisterControllers();
                                SnackBarWidget().showSuccessSnackbar(
                                    context, 'Registeration success');
                              } else {
                                SnackBarWidget().showErrorSnackbar(
                                    context, 'passwords does not match');
                              }
                            } catch (e) {
                              SnackBarWidget().showErrorSnackbar(context,
                                  'Already existed E-mail or invalid E-mail');
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPoppins(name: "Already have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      authProvider.clearRegisterControllers();
                    },
                    child: textAbel(
                        name: 'Login Now',
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

  circularIndicator() {
    if (isLoading = true) {
      return const CircularProgressIndicator(
        color: Colors.black,
      );
    }
  }
}