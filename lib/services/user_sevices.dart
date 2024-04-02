// import 'dart:io';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ProductService {
//   String cars = 'car';
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   //late CollectionReference<CarModel> car;
//   Reference storage = FirebaseStorage.instance.ref();
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   //final ImagePicker imagePicker = ImagePicker();

//   ProductService() {
//     // car = firestore.collection(cars).withConverter<CarModel>(
//     //     fromFirestore: (snapshot, options) {
//     //   return CarModel.fromJson(snapshot.id, snapshot.data()!);
//     // }, toFirestore: (value, options) {
//     //   return value.toJson();
//     // });
//   }

//   // Future<void> addCar(CarModel data) async {
//   //   try {
//   //     await car.add(data);
//   //   } catch (e) {
//   //     log('Error while adding car :$e');
//   //   }
//   }

//   Future<void> deleteCar(String id) async {
//     // try {
//     //   await car.doc(id).delete();
//     // } catch (e) {
//     //   log('Error while deleting car: $e');
//     // }
//   }

//   // Future<List<CarModel>> getAllCars() async {
//   //   final snapshot = await car.get();
//   //   return snapshot.docs.map((doc) => doc.data()).toList();
//   // }

// //   Future<void> wishListClicked(String id, bool status) async {
// //     try {
// //       if (status == true) {
// //         await car.doc(id).update({
// //           'wishlist': FieldValue.arrayUnion([
// //             firebaseAuth.currentUser!.email ??
// //                 firebaseAuth.currentUser!.phoneNumber
// //           ])
// //         });
// //       } else {
// //         await car.doc(id).update({
// //           'wishlist': FieldValue.arrayRemove([
// //             firebaseAuth.currentUser!.email ??
// //                 firebaseAuth.currentUser!.phoneNumber
// //           ])
// //         });
// //       }
// //     } catch (e) {
// //       log('got a error of :$e');
// //     }
// //   }

// //   Future<String> uploadImage(imageName, imageFile) async {
// //     Reference imageFolder = storage.child('productImage');
// //     Reference? uploadImage = imageFolder.child('$imageName.jpg');

// //     await uploadImage.putFile(imageFile);
// //     String downloadURL = await uploadImage.getDownloadURL();
// //     log('Image successfully uploaded to Firebase Storage.');
// //     return downloadURL;
// //   }

// //   // Future<File?> pickImage(ImageSource source) async {
// //   //   final pickedFile = await imagePicker.pickImage(source: source);
// //   //   if (pickedFile != null) {
// //   //     return File(pickedFile.path);
// //   //   }
// //   //   return null;
// //   // }
// // }


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olx_app_firebase/model/user_model.dart';

class UserService {
  String collection = 'user';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<UserModel> collectionReference;
  Reference storage = FirebaseStorage.instance.ref();

  UserService() {
    collectionReference =
        firestore.collection(collection).withConverter<UserModel>(
              fromFirestore: (snapshot, options) =>
                  UserModel.fromJson(snapshot.id, snapshot.data()!),
              toFirestore: (value, options) => value.toJson(),
            );
  }

  Future<List<UserModel>> getAllUserData() async {
    final snapshot = await collectionReference.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<void> addProduct(UserModel data) async {
    try {
      await collectionReference.add(data);
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('userImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }
}