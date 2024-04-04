
// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:intl/intl.dart';
// // import 'package:olx_app_firebase/model/product_model.dart';

// // class ProductProvider extends ChangeNotifier {
// //   File? pickedImage;
// //   String imageName = DateTime.now().microsecondsSinceEpoch.toString();
// //   String? downloadUrl;
// //   bool isLoading = false;
// //   bool isAddingData = false;

// //   final productDataFormKey = GlobalKey<FormState>();

// //   ProductProvider carService = ProductProvider();
// //  final ImagePicker imagePicker = ImagePicker();
// //   final FirebaseStorage storage = FirebaseStorage.instance;
// //   TextEditingController carNameController = TextEditingController();
// //   TextEditingController descriptionController = TextEditingController();
// //   TextEditingController priceController = TextEditingController();
// //   TextEditingController kmController = TextEditingController();
// //   TextEditingController searchController = TextEditingController();
// //   TextEditingController dateController = TextEditingController();
// //   List<ProductModel> searchList = [];
// //   List<ProductModel> allproductList = [];

// //   void setIsAddingData(bool value) {
// //     isAddingData = value;
// //     notifyListeners();
// //   }

// //   Future<void> selectDate(BuildContext context) async {
// //     final DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime.now(),
// //       lastDate: DateTime(2101),
// //     );

// //     if (pickedDate != null) {
// //       dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
// //     }
// //     notifyListeners();
// //   }

// //   void clearCarControllers() {
// //     carNameController.clear();
// //     kmController.clear();
// //     dateController.clear();
// //     descriptionController.clear();
// //     priceController.clear();
// //     pickedImage = null;
// //   }

// //   void addProduct(ProductModel data) async {
// //      carService.addProduct(data);

// //     notifyListeners();
// //     getAllCar();
// //   }

// //   void deleteCar(String id) async {
// //   //  await carService.deleteCar(id);
// //     getAllCar();
// //   }

// //   void getAllCar() async {
// //     isLoading = true;

// //     // allCarList = await carService.getAllCars();
// //     isLoading = false;
// //     notifyListeners();
// //   }

// //   Future<String> uploadImage(image, imageName) async {
// //     try {
// //       if (image != null) {
// //         String downloadUrl = await carService.uploadImage(imageName, image);
// //         log(downloadUrl);
// //         notifyListeners();
// //         return downloadUrl;
// //       } else {
// //         log('image is null');
// //         return '';
// //       }
// //     } catch (e) {
// //       log('got an error of $e');
// //       rethrow;
// //     }
// //   }

// //   Future getImage(ImageSource source) async {
// //     final pickedFile = await imagePicker.pickImage(source: source);

// //     if (pickedFile != null) {
// //       pickedImage = File(pickedFile.path);
// //       log("Image picked");
// //       notifyListeners();
// //     }
// //   }

// //   // void search(String value) {
// //   //   if (value.isEmpty) {
// //   //     searchList = [];
// //   //   } else {
// //   //     searchList = allproductList
// //   //         .where((ProductModel car) =>
// //   //             product.productName!.toLowerCase().contains(value.toLowerCase()))
// //   //         .toList();
// //   //   }
// //   //   notifyListeners();
// //   // }

// //   // Future<void> wishlistClicked(String id, bool status) async {
// //   //   await carService.wishListClicked(id, status);
// //   //   notifyListeners();
// //   // }

// // //   bool wishListCheck(ProductModel product) {
// // //     final currentUser = FirebaseAuth.instance.currentUser;
// // //     if (currentUser != null) {
// // //       final user = currentUser.email ?? currentUser.phoneNumber;
// // //       if (product.wishList.contains(user)) {
// // //         getAllCar();
// // //         return false;
// // //       } else {
// // //         getAllCar();
// // //         return true;
// // //       }
// // //     } else {
// // //       return true;
// // //     }
// // //  }
// // }



// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:olx_app_firebase/controller/bottom_provider.dart';

// import 'package:olx_app_firebase/model/product_model.dart';
// import 'package:olx_app_firebase/services/database_services.dart';

// class DatabaseProvider extends ChangeNotifier {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController brandController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   final DatabaseService databaseService = DatabaseService();
//  final WidgetProvider widgetProviders = WidgetProvider();
//   List<ProductModel> allProduct = [];
//   List<ProductModel> searchedList = [];
//   String downloadURL = '';
//   bool? isEdit;
//   String imageName = DateTime.now().millisecondsSinceEpoch.toString();

//   void loadDatasForEdit(ProductModel product) {
//     titleController = TextEditingController(text: product.title);
//     brandController = TextEditingController(text: product.brand);
//     locationController = TextEditingController(text: product.location);
//     descriptionController = TextEditingController(text: product.description);
//     priceController = TextEditingController(
//       text: product.price != null ? product.price.toString() : '',
//     );
//   }

// // wishlist functions
//   IsWishLIstClick(id, bool wishListStatus) async {
//     await databaseService.IsWishListClick(id, wishListStatus);
//     notifyListeners();
//     getAllProducts();
//   }

//   bool wishListCheck(ProductModel product) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       final user = currentUser.email ?? currentUser.phoneNumber;
//       if (product.wishList!.contains(user)) {
//         // notifyListeners();
//         getAllProducts();
//         return false;
//       } else {
//         getAllProducts();
//         return true;
//       }
//     } else {
//       return true;
//     }
//   }

//   Future<void> getAllProducts() async {
//     allProduct = await databaseService.getAllProducts();
//     notifyListeners();
//   }
// // my product functions

//   Future<void> deleteMyProduct(productId) async {
//     await databaseService.deleteMyProduct(productId);
//     notifyListeners();
//     getAllProducts();
//   }

//   addProduct(ProductModel data) async {
//     await databaseService.addProduct(data);
//     clearControllers();
//     getAllProducts();
//   }

//   updateMyProduct(productId, ProductModel data) async {
//     await databaseService.updateMyProudct(productId, data);
//     clearControllers();
//     notifyListeners();
//   }

//   idSold(String id) async {
//     await databaseService.IsSold(id);
//     getAllProducts();
//   }

//   // serach function
//   searchFilter(String value) {
//     searchedList = allProduct
//         .where((product) =>
//             product.title!.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }

// // image funtion
//   uploadImage(image) async {
//     try {
//       if (image != null) {
//         downloadURL = await databaseService.uploadImage(imageName, image);

//         notifyListeners();
//       } else {
//         log('image is null');
//       }
//     } catch (e) {
//       log("$e");
//       throw e;
//     }
//   }

//   clearControllers() {
//     titleController.clear();
//     brandController.clear();
//     priceController.clear();
//     locationController.clear();
//     descriptionController.clear();
//     notifyListeners();
//   }
// }
