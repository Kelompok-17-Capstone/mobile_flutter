import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/product_api.dart';
import 'package:mobile_flutter/models/product_model.dart';

enum ProductState {
  none,
  loading,
  failed
}

enum PriceState {
  none,
  ascending,
  descending
}

class ProductProvider extends ChangeNotifier {

  List<ProductModel> _products = [];
  List<ProductModel> _newProducts = [];
  List<ProductModel> _favoriteProducts = [];
  ProductState _state = ProductState.none;
  PriceState _priceState = PriceState.none;

  List<ProductModel> get products => _products;
  List<ProductModel> get newProducts => _newProducts;
  List<ProductModel> get favoriteProducts => _favoriteProducts;
  ProductState get state => _state;
  PriceState get priceState => _priceState;

  String _productTab = 'terbaru';
  
  bool _globalCooldown = false;

  void setProductState({required ProductState state}) {
    _state = state;
    notifyListeners();
  }

  Future<void> getNewProducts() async {
    setProductState(state: ProductState.loading);
    ProductAPI api = ProductAPI();
    _newProducts = await api.getAllProducts(tab: 'terbaru', price: '');
    if (_newProducts.isEmpty) {
      setProductState(state: ProductState.failed);
    } else {
      setProductState(state: ProductState.none);
    }
  }

  void getAllProducts() async {
    if (_globalCooldown) {
      return;
    }

    _globalCooldown = true;
    setProductState(state: ProductState.loading);
    ProductAPI api = ProductAPI();

    Future.delayed(const Duration(seconds: 1), () async {
      _products = await api.getAllProducts(
        tab: _priceState != PriceState.none ? '' : _productTab,
        price: _priceState == PriceState.none ? '' : _priceState == PriceState.ascending ? 'asc' : 'desc'
      );
      if (_products.isEmpty) {
        setProductState(state: ProductState.failed);
      } else {
        setProductState(state: ProductState.none);
      }
      _globalCooldown = false;
    });
  }

  void getFavoriteProduct() async {
    final api = ProductAPI();
    setProductState(state: ProductState.loading);
    final List<ProductModel> result = await api.getFavoriteProduct();
    if (result.isNotEmpty) {
      _favoriteProducts = result;
    }
    setProductState(state: ProductState.none);
  }

  void setProductTab({required String productTab}) {
    _productTab = productTab;
    getAllProducts();
  }

  void setPriceState({required PriceState state}) {
    _priceState = state;
    getAllProducts();
  }

}