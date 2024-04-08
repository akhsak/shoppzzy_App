import 'dart:io';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/services/service.dart';

class ProductProvider extends ChangeNotifier {
  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;
  bool isLoading = false;
  bool isAddingData = false;

  final productDataFormKey = GlobalKey<FormState>();

  ProductService productService = ProductService();
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  List<ProductModel> searchList = [];
  List<ProductModel> allProductList = [];

  void setIsAddingData(bool value) {
    isAddingData = value;
    notifyListeners();
  }

  void clearProductControllers() {
    productNameController.clear();
    locationController.clear();
    categoryController.clear();
    descriptionController.clear();
    priceController.clear();
    pickedImage = null;
  }

  void addProduct(ProductModel data) async {
    await productService.addProduct(data);

    notifyListeners();
    getAllProduct();
  }

  void deleteProduct(String id) async {
    await productService.deleteProduct(id);
    getAllProduct();
  }

  void getAllProduct() async {
    isLoading = true;
    allProductList = await productService.getAllProducts();
    isLoading = false;
    notifyListeners();
  }

  Future<String> uploadImage(image, imageName) async {
    try {
      if (image != null) {
        String downloadUrl = await productService.uploadImage(imageName, image);
        log(downloadUrl);
        notifyListeners();
        return downloadUrl;
      } else {
        log('image is null');
        return '';
      }
    } catch (e) {
      log('got an error of $e');
      rethrow;
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }

  void search(String value) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = allProductList
          .where((ProductModel product) =>
              product.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> wishlistClicked(String id, bool status) async {
    await productService.wishListClicked(id, status);
    notifyListeners();
  }

  bool wishListCheck(ProductModel product) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = currentUser.email ?? currentUser.phoneNumber;
      if (product.wishList.contains(user)) {
        getAllProduct();
        return false;
      } else {
        getAllProduct();
        return true;
      }
    } else {
      return true;
    }
  }
}
