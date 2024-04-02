
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olx_app_firebase/model/product_model.dart';

class DatabaseService {
  String collection = 'products';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;
  Reference storage = FirebaseStorage.instance.ref();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  DatabaseService() {
    collectionReference =
        firestore.collection(collection).withConverter<ProductModel>(
      fromFirestore: (snapshot, options) {
        return ProductModel.fromJson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> addProduct(ProductModel data) async {
    try {
      await collectionReference.add(data);
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot =
        await collectionReference.orderBy('timeStamp', descending: true).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  IsSold(String id) async {
    await collectionReference.doc(id).update({'isSold': true});
  }

  Future<void> IsWishListClick(String id, bool wishListStatus) async {
    try {
      if (wishListStatus == true) {
        await collectionReference.doc(id).update({
          'wishList': FieldValue.arrayUnion([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      } else {
        await collectionReference.doc(id).update({
          'wishList': FieldValue.arrayRemove([
            firebaseAuth.currentUser!.email ??
                firebaseAuth.currentUser!.phoneNumber
          ])
        });
      }
    } catch (e) {
      log('Error updating wishlist status: $e');
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

  updateMyProudct(productId, ProductModel data) async {
    try {
      await collectionReference.doc(productId).update(data.toJson());
      log('sdajfjkasfsaf');
    } catch (e) {
      log('Error : product is not updated $e');
    }
  }

  deleteMyProduct(productId) async {
    try {
      await collectionReference.doc(productId).delete();
      log("Product is deleted");
    } catch (e) {
      log('Product is not deleted: $e');
    }
  }
}
