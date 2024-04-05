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
