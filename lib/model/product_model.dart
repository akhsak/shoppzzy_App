// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductModel {
//   String? userName;
//   String? id;
//   String? uId;
//   String? title;
//   String? brand;
//   String? description;
//   String? category;
//   bool? isSold;
//   List<String>? wishList;
//   DateTime? timeStamp;
//   String? location;
//   String? image;
//   int? price;

//   ProductModel(
//       {this.category,
//       this.userName,
//       this.id,
//       this.uId,
//       this.location,
//       this.isSold,
//       this.image,
//       this.price,
//       this.description,
//       this.brand,
//       this.timeStamp,
//       this.title,
//       this.wishList});
      
//   factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
//     return ProductModel(
//       userName: json['userName'],
//       uId: json['uId'],
//       id: id,
//       location: json['location'],
//       timeStamp: json['timeStamp'] != null
//           ? (json['timeStamp'] as Timestamp).toDate()
//           : null,
//       category: json['category'],
//       image: json['image'],
//       price: json['price'],
//       brand: json['brand'],
//       isSold: json['isSold'],
//       description: json['description'],
//       title: json['title'],
//       wishList: List<String>.from(json["wishList"] ?? []),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'uId': uId,
//       'category': category,
//       'userName': userName,
//       'location': location,
//       'image': image,
//       'price': price,
//       'isSold': isSold,
//       'brand': brand,
//       'description': description,
//       'timeStamp': timeStamp,
//       'title': title,
//       'wishList': wishList,
//     };
//   }
// }