import 'dart:convert';

class OrderModel {
  final String id;
  final String address;
  final int totalPrice;
  final String status;

  const OrderModel({required this.id, required this.address, required this.totalPrice, required this.status});

  static OrderModel fromJson({json}) {
    final data = jsonDecode(json);
    return OrderModel(
      id: data['id'],
      address: data['address'],
      totalPrice: data['grand_total_price'],
      status: data['status']
    );
  }
}