import 'dart:io';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_app_firebase/model/product_model.dart';
import 'package:olx_app_firebase/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String downloadUrl = '';
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
  TextEditingController titleController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  List<ProductModel> searchList = [];
  List<ProductModel> allProductList = [];
  bool? isEdit;

  void loadDatasForEdit(ProductModel product) {
    titleController = TextEditingController(text: product.title);
    brandController = TextEditingController(text: product.brand);
    locationController = TextEditingController(text: product.location);
    descriptionController = TextEditingController(text: product.description);
    priceController = TextEditingController(
      text: product.price != null ? product.price.toString() : '',
    );
  }

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
    notifyListeners();
  }

  void addProduct(ProductModel data) async {
    await productService.addProduct(data);
    clearProductControllers();
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

  idSold(String id) async {
    await productService.IsSold(id);
    getAllProduct();
  }

  // image funtion
  uploadImage(image) async {
    try {
      if (image != null) {
        downloadUrl = await productService.uploadImage(imageName, image);

        notifyListeners();
      } else {
        log('image is null');
      }
    } catch (e) {
      log("$e");
      throw e;
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
              product.title!.toLowerCase().contains(value.toLowerCase()))
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
      if (product.wishList!.contains(user)) {
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

  updateMyProduct(String? id, ProductModel product) {}

  // updateMyProduct(String? id, ProductModel product) {

  // }
}
