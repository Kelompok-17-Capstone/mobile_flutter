import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_flutter/models/coin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CoinAPI {
  final String api = dotenv.env['API']!;

  Future<List<CoinModel>> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/coin');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List? result = jsonDecode(response.body)['history'];
        if (result == null) {
          return [];
        }
        final List<CoinModel> history = result.map((element) {
          final json = jsonEncode(element);
          return CoinModel.fromJson(json: json);
        }).toList();
        return history;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }
}