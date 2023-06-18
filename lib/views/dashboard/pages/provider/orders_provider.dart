import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/order_api.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/order_model.dart';

enum OrdersState {
  none,
  loading,
  failed
}

class OrdersProvider extends ChangeNotifier {

  List<OrderModel> _orders = [];
  OrdersState _ordersState = OrdersState.none;

  List<OrderModel> get orders => _orders;
  OrdersState get ordersState => _ordersState;

  bool _globalCooldown = false;

  void getOrders({required String status}) async {
    if (_globalCooldown) {
      return;
    }

    _globalCooldown = true;
    final api = OrderAPI();
    setOrdersState(state: OrdersState.loading);

    await Future.delayed(const Duration(seconds: 2), () async {
      final List<OrderModel> result = await api.getOrder(status: status);
      _orders = result;
      _globalCooldown = false;
      setOrdersState(state: OrdersState.none);
    });
  }

  Future<String> createOrder({
    required String address,
    required List<ItemCartModel> items,
    required bool isCoin,
    required bool isCart
  }) async {
    final api = OrderAPI();
    final result = await api.createOrder(address: address, items: items, isCoin: isCoin, isCart: isCart);
    return result;
  }

  void setOrdersState({required OrdersState state}) {
    _ordersState = state;
    notifyListeners();
  }

}