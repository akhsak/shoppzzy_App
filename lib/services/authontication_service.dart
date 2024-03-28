// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/view/authontication_screen.dart/otp_screen.dart';

import 'package:olx_app_firebase/widgets/bottom_screen.dart';
import 'package:olx_app_firebase/widgets/snackbar_widget.dart';

class AuthenticationService {
  String collection = 'user';
  String? verificationid;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GithubAuthProvider githubAuthProvider = GithubAuthProvider();

  Future<UserCredential> userEmailRegister(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');

      return userCredential;
    } catch (e) {
      log('error got with : $e');
      rethrow;
    }
  }

  Future<UserCredential> userEmailLogin(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      log('user loged in');
      return userCredential;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("${guser?.displayName}");
    } catch (e) {
      log('Google Sign-In Error: $e');
      rethrow;
    }
  }

  Future googleSignOut() async {
    return await GoogleSignIn().signOut();
  }

  Future gitHubSignIn() async {
    try {
      UserCredential user =
          await firebaseAuth.signInWithProvider(githubAuthProvider);
      User gitUser = user.user!;
      final UserModal userData = UserModal(
          uId: gitUser.uid,
          userName: gitUser.displayName,
          email: gitUser.email);
      firestore.collection('user').doc(gitUser.uid).set(userData.toJson());
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<void> getOtp(String phoneNumber) async {
  //   try {
  //     await firebaseAuth.verifyPhoneNumber(
  //         phoneNumber: phoneNumber,
  //         verificationCompleted: (PhoneAuthCredential) async {
  //           await firebaseAuth.signInWithCredential(PhoneAuthCredential);
  //           User? user = FirebaseAuth.instance.currentUser;
  //           if (user != null) {
  //             await user.updatePhoneNumber(PhoneAuthCredential);
  //           }
  //         },
  //         verificationFailed: (error) {
  //           log('verification failed due to :$error');
  //         },
  //         codeSent: (verificationId, forceResendingToken) {
  //           verificationid = verificationId;
  //         },
  //         codeAutoRetrievalTimeout: (verificationId) {
  //           verificationid = verificationId;
  //         },
  //         timeout: const Duration(seconds: 60));
  //   } catch (e) {
  //     log('sign in error due to :$e');
  //   }
  // }

  Future<void> getOtp(context, phoneNumberCon) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationId, int? resendtoken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumberCon);
  }

  Future<PhoneAuthCredential?> verifyOtp(String otp, context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationid!, smsCode: otp);

      await firebaseAuth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomScreen(),
          ),
          (route) => false);
      SnackBarWidget().showSuccessSnackbar(context, "OTP validated");
    } catch (e) {
      log("verify otp error $e");
      return null;
    }
    return null;
  }
}