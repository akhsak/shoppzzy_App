import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:olx_app_firebase/view/select_loginScreen.dart';
import 'package:olx_app_firebase/widgets/bottom_screen.dart';

class AuthenticationNavigate extends StatelessWidget {
  const AuthenticationNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? BottomScreen() : const SelectLoginScreen(),
    );
  }
}