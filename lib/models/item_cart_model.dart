
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/models/product_model.dart';

class ItemCartModel extends Equatable {
  final ProductModel product;
  int itemCount;

  ItemCartModel({required this.product, required this.itemCount});

  int getSubTotal() {
    return product.price * itemCount;
  }
  
  @override
  List<Object?> get props => [product];
}