import 'dart:convert';

import 'package:mobile_flutter/models/product_model.dart';

class ItemCartModel {
  final String cartId;
  final ProductModel product;
  int itemCount;

  ItemCartModel({required this.cartId, required this.product,  this.itemCount = 1});

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