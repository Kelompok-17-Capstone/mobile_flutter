import 'dart:convert';

class UserModel {

  final String name;
  final String email;
  final String phoneNumber;
  final List<UserAddress> address;
  final String image;
  final String memberCode;
  final int balance;
  final int coin;

  const UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.image,
    required this.memberCode,
    required this.balance,
    required this.coin
  });

  static UserModel fromJson({required json}) {
    final data = jsonDecode(json);
    final List address = data['address'] ?? [];
    return UserModel(
      name: data['name'], 
      email: data['email'], 
      phoneNumber: data['phone_number'], 
      address: address.map((element) {
        return UserAddress(
          id: element['id'],
          address: element['address'],
          status: element['status']
        );
      }).toList(),
      image: data['image'],
      memberCode: data['member_code'],
      balance: data['balance'],
      coin: data['coin']
    );
  }

}

class UserAddress {
  final int id;
  final String address;
  bool status;

  UserAddress({required this.id, required this.address, required this.status});
}