import 'dart:convert';

class UserModel {

  final String name;
  final String email;
  final String phoneNumber;
  final List address;
  final String image;
  final String memberCode;

  UserModel({required this.name, required this.email, required this.phoneNumber, required this.address, required this.image, required this.memberCode});

  static UserModel fromJson({required json}) {
    final data = jsonDecode(json);
    return UserModel(
      name: data['name'], 
      email: data['email'], 
      phoneNumber: data['phone_number'], 
      address: data['address'],
      image: data['image'],
      memberCode: data['member_code']
    );
  }

}