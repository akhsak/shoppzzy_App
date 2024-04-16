import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? uId;
  String? name;
  String? title;
  String? location;
  String? description;
  String? category;
  String? brand;
  int? price;
  String? image;
  List<String>? wishList;
  bool? isSold;
  DateTime? timeStamp;

  ProductModel(
      {this.id,
      this.uId,
      this.image,
      this.location,
      this.isSold,
      this.timeStamp,
      this.name,
      this.brand,
      this.description,
      this.price,
      this.wishList,
      this.category,
      this.title});

  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
        id: id,
        uId: json['uId'],
        image: json['image'],
        name: json['name'],
        location: json['location'],
        isSold: json['isSold'],
        timeStamp: json['timeStamp'] != null
            ? (json['timeStamp'] as Timestamp).toDate()
            : null,
        category: json['category'],
        title: json['title'],
        brand: json['brand'],
        description: json['description'],
        price: json['price'],
        wishList: List<String>.from(json['wishlist']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uId': uId,
      'image': image,
      'name': name,
      'category': category,
      'location': location,
      'isSold': isSold,
      'brand': brand,
      'description': description,
      'timeStamp': timeStamp,
      'title': title,
      'price': price,
      'wishlist': wishList
    };
  }
}
