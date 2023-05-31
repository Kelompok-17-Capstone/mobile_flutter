import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/product_api.dart';
import 'package:mobile_flutter/models/product_model.dart';

enum ProductState {
  none,
  loading,
  error
}

class ProductProvider extends ChangeNotifier {

  List<ProductModel> _products = [];
  ProductState _state = ProductState.none;

  List<ProductModel> get products => _products;
  ProductState get state => _state;

  Future<void> getAllProducts() async {
    setProductState(state: ProductState.loading);
    ProductAPI api = ProductAPI();
    _products = await api.getAllProducts();
    if (_products.isEmpty) {
      setProductState(state: ProductState.error);
    } else {
      setProductState(state: ProductState.none);
    }
  }

  void setProductState({required ProductState state}) {
    _state = state;
    notifyListeners();
  }

}