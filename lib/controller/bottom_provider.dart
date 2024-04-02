import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WidgetProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onTap( index) {
    currentIndex = index;
    notifyListeners();
  }
   ImagePicker _imagePicker = ImagePicker();
  File? file;

  pickImage(ImageSource source) async {
    final img = await _imagePicker.pickImage(source: source);
    file = img != null ? File(img.path) : null;
    notifyListeners();
  }

  //Switch
  final isSwitched = ValueNotifier<bool>(false);

  // Function to toggle the switch state
  void toggleSwitch(bool newState) {
    isSwitched.value = newState;
    notifyListeners();
  }

  // settings page
  bool isUsernameEdit = true;
  bool isPasswordEdit = true;

  void userNameClicked() {
    isUsernameEdit = !isUsernameEdit;
    notifyListeners();
  }

  void passwordClicked() {
    isPasswordEdit = !isPasswordEdit;
    notifyListeners();
  }
}
