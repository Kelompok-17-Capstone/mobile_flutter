import 'package:mobile_flutter/models/item_cart_model.dart';

class CheckoutViewArgument {
  final List<ItemCartModel> cart;
  final bool isCart;

  const CheckoutViewArgument({required this.cart, required this.isCart});
}