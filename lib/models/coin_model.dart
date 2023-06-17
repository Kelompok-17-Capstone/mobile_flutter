import 'dart:convert';

class CoinModel {
  final String status;
  final int total;
  final String date;

  const CoinModel({required this.status, required this.total, required this.date});

  static CoinModel fromJson({json}) {
    final data = jsonDecode(json);
    return CoinModel(
      status: data['status'],
      total: data['total'],
      date: data['created_at']
    );
  }
}