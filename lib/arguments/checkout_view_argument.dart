import 'package:mobile_flutter/models/item_cart_model.dart';

class CheckoutViewArgument {
  final List<ItemCartModel> cart;

  const CheckoutViewArgument({required this.cart});
}