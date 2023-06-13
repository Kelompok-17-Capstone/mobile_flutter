// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/product_api.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';

class CartProvider extends ChangeNotifier {

  List<ItemCartModel> _items = [];
  int _totalProduct = 0;

  List<ItemCartModel> get items => _items;
  int get totalProduct => _totalProduct;

  bool _globalCooldown = false;

  void getCart() async {
    if (_globalCooldown) {
      return;
    }
    final api = ProductAPI();
    final List<ItemCartModel> result = await api.getCart();
    if (result.isNotEmpty) {
      _items = result;
      countTotal();
    }
  }

  void addToCart(ItemCartModel item) {
    if (_items.contains(item)) {
      _items.elementAt(_items.indexOf(item)).itemCount += 1;
    } else {
      _items.add(item);
    }
    countTotal();
  }

  Future<void> updateItemCount({required int index}) async {
    final api = ProductAPI();
    await api.updateItemCount(cartId: _items[index].cartId, count: _items[index].itemCount);
    countTotal();
  }

  void localItemCount({required int index, required int count}) {
    if (_globalCooldown) {
      _items[index].itemCount += count;
      countTotal();
      return;
    }
    _globalCooldown = true;
    _items[index].itemCount += count;
    countTotal();
    Future.delayed(const Duration(seconds: 3), () async {
      await updateItemCount(index: index);
      _globalCooldown = false;
    });
  }

  void countTotal() {
    int result = 0;
    for (var item in _items) {
      result += item.product.price * item.itemCount;
    }
    _totalProduct = result;
    notifyListeners();
  }

}