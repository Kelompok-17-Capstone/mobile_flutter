import 'dart:convert';

import 'package:mobile_flutter/models/product_model.dart';

class ItemCartModel {
  final int? cartId;
  final ProductModel product;
  int itemCount;
  bool isChecked;

  ItemCartModel({required this.cartId, required this.product,  this.itemCount = 1, this.isChecked = false});

  int getSubTotal() {
    return product.price * itemCount;
  }

  static ItemCartModel fromJson({required json, required ProductModel product}) {
    final item = jsonDecode(json);
    return ItemCartModel(
      cartId: item['id'],
      product: product,
      itemCount: item['quantity']
    );
  }
  
}