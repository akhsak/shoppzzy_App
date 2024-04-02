import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/model/user_model.dart';
import 'package:olx_app_firebase/services/user_sevices.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String downloadURL = '';
  // bool? isEdit;
  String imageName = DateTime.now().millisecondsSinceEpoch.toString();
  List<UserModel> allUserDatas = [];

  Future<void> getUserData() async {
    try {
      allUserDatas = await UserService().getAllUserData();
    } catch (e) {
      print("Error fetching user data: $e");
    }
    notifyListeners();
  }

  UserModel? getCurrentUserData(uId) {
    if (uId != null) {
      final userData = allUserDatas.firstWhere(
        (user) => user.uId == uId,
        orElse: () => UserModel(
          email: '',
          name: '',
          phoneNumber: '',
          address: '',
          profilePic: null,
          uId: uId,
        ),
      );
      return userData;
    }
    return null;
  }

  addProduct(UserModel data) async {
    await UserService().addProduct(data);
    clearControllers();
    getUserData();
  }

  uploadImage(image) async {
    try {
      if (image != null) {
        downloadURL = await UserService().uploadImage(imageName, image);

        notifyListeners();
      } else {
        log('image is null');
      }
    } catch (e) {
      log("$e");
      throw e;
    }
  }

  clearControllers() {
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    addressController.clear();

    notifyListeners();
  }

  void loadDatasForEdit(UserModel product) {
    nameController = TextEditingController(text: product.name);
    emailController = TextEditingController(text: product.email);
    phoneNumberController = TextEditingController(text: product.phoneNumber);
    addressController = TextEditingController(text: product.address);
  }
}