class ProductModel {
  String? id;
  String? name;
  String? location;
  String? description;
  String? brand;
  int? price;
  String? image;
  List wishList;

  ProductModel(
      {this.id,
      this.image,
      this.location,
      required this.name,
      required this.brand,
      required this.description,
      required this.price,
      required this.wishList});

  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
        id: id,
        image: json['image'],
        name: json['name'],
        location: json['location'],
        brand: json['brand'],
        description: json['description'],
        price: json['price'],
        wishList: List<String>.from(json['wishlist']));
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'location': location,
      'brand': brand,
      'description': description,
      'price': price,
      'wishlist': wishList
    };
  }
}