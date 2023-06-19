import 'dart:convert';

import 'package:mobile_flutter/models/product_model.dart';

class ItemCartModel {
  final int? cartId;
  final String productId;
  final String productName;
  final int productPrice;
  final String imgUrl;
  int itemCount;
  bool isChecked;

  ItemCartModel({
    required this.cartId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.imgUrl,
    this.itemCount = 1,
    this.isChecked = false
  });

  int getSubTotal() {
    return productPrice * itemCount;
  }

  static ItemCartModel fromJson({required json}) {
    final item = jsonDecode(json);
    return ItemCartModel(
      cartId: item['id'],
      productId: item['product']['id'],
      productName: item['product']['name'],
      productPrice: item['product']['price'],
      imgUrl: item['product']['image'],
      itemCount: item['quantity']
    );
  }
  
}