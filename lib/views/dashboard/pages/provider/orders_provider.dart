// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/orders_api.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/orders_model.dart';

enum OrdersState {
  none,
  loading,
  failed
}

class OrdersProvider extends ChangeNotifier {

  List<OrdersModel> _orders = [];
  OrdersState _ordersState = OrdersState.none;

  List<OrdersModel> get orders => _orders;
  OrdersState get ordersState => _ordersState;

  bool _globalCooldown = false;

  void getOrders({required String status}) async {
    if (_globalCooldown) {
      return;
    }

    _globalCooldown = true;
    final api = OrdersApi();
    setOrdersState(state: OrdersState.loading);

    await Future.delayed(const Duration(seconds: 2), () async {
      final List<OrdersModel> result = await api.getOrders(status: status);
      if (result.isNotEmpty) {
        _orders = result;
        setOrdersState(state: OrdersState.none);
      } else {
        setOrdersState(state: OrdersState.failed);
      }
    });
  }

  Future<String> createOrder({
    required String address,
    required List<ItemCartModel> items,
    required bool isCoin,
    required bool isCart
  }) async {
    final api = OrdersApi();
    final result = await api.createOrder(address: address, items: items, isCoin: isCoin, isCart: isCart);
    return result;
  }

  void setOrdersState({required OrdersState state}) {
    _ordersState = state;
    notifyListeners();
  }

}