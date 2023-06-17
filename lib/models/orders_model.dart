import 'dart:convert';

class OrdersModel {
  final String id;
  final String address;
  final int totalPrice;
  final String status;

  const OrdersModel({required this.id, required this.address, required this.totalPrice, required this.status});

  static OrdersModel fromJson({json}) {
    final data = jsonDecode(json);
    return OrdersModel(
      id: data['id'],
      address: data['address'],
      totalPrice: data['grand_total_price'],
      status: data['status']
    );
  }
}