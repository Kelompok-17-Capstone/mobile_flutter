import 'dart:convert';

class UserModel {

  final String fullName;
  final String email;
  final String phone;
  final String address;

  UserModel({required this.fullName, required this.email, required this.phone, required this.address});

  static UserModel fromJson({required json}) {
    final data = jsonDecode(json);
    return UserModel(
      fullName: data['fullName'], 
      email: data['email'], 
      phone: data['phone'], 
      address: data['address']
    );
  }

}