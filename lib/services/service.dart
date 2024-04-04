import 'dart:io';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olx_app_firebase/model/model.dart';

class ProductService {
  String products = 'product';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> product;
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ImagePicker imagePicker = ImagePicker();

  ProductService() {
    product = firestore.collection(products).withConverter<ProductModel>(
        fromFirestore: (snapshot, options) {
      return ProductModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  Future<void> addProduct(ProductModel data) async {
    try {
      await product.add(data);
    } catch (e) {
      log('Error while adding car :$e');
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await product.doc(id).delete();
    } catch (e) {
      log('Error while deleting car: $e');
    }
  }

  Future<List<ProductModel>> getAllCars() async {
    final snapshot = await product.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> wishListClicked(String id, bool status) async {
    try {
      if (status == true) {
        await product.doc(id).update({
          'wishlist': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await product.doc(id).update({
          'wishlist': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('got a error of :$e');
    }
  }

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('productImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }

  Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}