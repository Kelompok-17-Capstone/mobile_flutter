import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/coin_api.dart';
import 'package:mobile_flutter/models/coin_model.dart';

enum CoinState {
  none,
  loading,
  failed
}

class CoinProvider extends ChangeNotifier {

  List<CoinModel> _history = [];
  CoinState _state = CoinState.none;

  List<CoinModel> get history => _history;
  CoinState get state => _state;

  void getHistory() async {
    setState(state: CoinState.loading);
    final api = CoinAPI();
    final List<CoinModel> result = await api.getHistory();
    if (result.isNotEmpty) {
      _history = result;
    }
    setState(state: CoinState.none);
  }

  void setState({required CoinState state}) {
    _state = state;
    notifyListeners();
  }

}