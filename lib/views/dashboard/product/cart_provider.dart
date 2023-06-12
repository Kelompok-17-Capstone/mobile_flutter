// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/product_api.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';

class CartProvider extends ChangeNotifier {

  List<ItemCartModel> _items = [];
  int _amount = 0;
  int _totalProduct = 0;

  List<ItemCartModel> get items => _items;
  int get totalProduct => _totalProduct;
  int get amount => _amount;

  void getCart() async {
    final api = ProductAPI();
    final List<ItemCartModel> result = await api.getCart();
    if (result.isNotEmpty) {
      _items = result;
      notifyListeners();
    }
  }

  void addToCart(ItemCartModel item) {
    if (_items.contains(item)) {
      _items.elementAt(_items.indexOf(item)).itemCount += 1;
    } else {
      _items.add(item);
    }
    countAmount();
    countTotal();
    notifyListeners();
  }

  void countAmount() {
    _amount = 0;
    for (var item in _items) {
      _amount += item.itemCount;
    }
  }

  void countTotal() {
    for (var item in _items) {
      _totalProduct += item.product.price;
    }
  }

}