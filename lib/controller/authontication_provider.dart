import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:olx_app_firebase/services/authontication_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController adminController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;
  bool isAdminHome = false;
  final loginFormkey = GlobalKey<FormState>();
  final registerFormkey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final adminFormkey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthenticationService authService = AuthenticationService();

  void clearAdminController() {
    adminController.clear();
    adminPassController.clear();
  }

  void clearPhoneController() {
    phoneController.clear();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void clearRegisterControllers() {
    registerEmailController.clear();
    registerPasswordController.clear();
    confirmPasswordController.clear();
  }

  Future<UserCredential> registerUser(String email, String password) async {
    return await authService.userEmailRegister(email, password);
  }

  Future<UserCredential> loginUser(String email, String password) async {
    return await authService.userEmailLogin(email, password);
  }

  Future<void> logOut() async {
    await authService.logOut();
  }

  Future<void> googleSignIn() async {
    await authService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await authService.googleSignOut();
    notifyListeners();
  }

  Future<void> gitHubSignIn() async {
    try {
      await authService.gitHubSignIn();
    } catch (e) {
      throw Exception('Exception $e');
    }
    notifyListeners();
  }

  void obscureChange() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> getOtp(context, phoneCon) async {
    await authService.getOtp(context, phoneCon);
    notifyListeners();
  }

  Future<void> verifyOtp(otp, context) async {
    await authService.verifyOtp(otp, context);
    notifyListeners();
  }
}