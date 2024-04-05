import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/authontication_provider.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/signup_page.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/widgets/login_widgtets.dart';
import 'package:olx_app_firebase/widgets/bottom_screen.dart';
import 'package:olx_app_firebase/widgets/snackbar_widget.dart';
import 'package:olx_app_firebase/widgets/text_formfield.dart';
import 'package:olx_app_firebase/widgets/text_style.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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
        padding: EdgeInsets.only(top: size.height * .05, left: 15, right: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome Text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              textPoppins(
                name: 'sign in to continue',
              ),
              SizedBox(
                height: size.height * 0.5,
                child: Form(
                  key: authProvider.loginFormkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        child: CustomTextFormField(
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                          labelText: 'Email',
                          controller: authProvider.loginEmailController,
                          validateMsg: 'Enter Your E-mail',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Consumer<AuthenticationProvider>(
                          builder: (context, value, child) =>
                              CustomTextFormField(
                            prefixIcon: Icon(Icons.lock, color: Colors.black),
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
                      ),
                      // Customized Button
                      ElevatedButton(
                        onPressed: () async {
                          if (authProvider.loginFormkey.currentState!
                              .validate()) {
                            try {
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
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: Text(
                          'L O G I N',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
                              builder: (context) => SignUpScreen()));
                      authProvider.clearLoginControllers();
                    },
                    child: textAbel(
                        name: 'SIGN UP',
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
