class UserModal {
  String? uId;
  String? userName;
  String? email;
  String? phoneNumber;

  UserModal(
      {required this.uId,
      required this.userName,
      required this.email,
      this.phoneNumber});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
        uId: json['userId'],
        userName: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': uId,
      'name': userName,
      'email': email,
      'phoneNumber': phoneNumber
    };
  }
}