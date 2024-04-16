class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? profilePic;

  UserModel({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.profilePic,
    required this.uId,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      profilePic: json['profilePic'],
      uId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'profilePic': profilePic,
      'userId': uId,
    };
  }
}
