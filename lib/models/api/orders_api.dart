import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/orders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrdersApi {
  final String api = dotenv.env['API']!;

  Future<List<OrdersModel>> getOrders({required String status}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/orders?status=$status');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return result.map((item) {
          final json = jsonEncode(item);
          return OrdersModel.fromJson(json: json);
        }).toList();
      }
    } catch (e) {
      print(e);
    }

    return [];
  }

  Future<String> createOrder({required String address, required List<ItemCartModel> items, required bool isCoin, required bool isCart}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/orders');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'address': address,
        'products': items.map((item) {
          return {
            'product_id': item.productId,
            'quantity': item.itemCount
          };
        }).toList(),        
        "coin": isCoin,
        "cart": isCart
      };

      final response = await http.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 201) {
        return 'success';
      } else {
        return jsonDecode(response.body).toString();
      }
    } catch (e) {
      print(e);
    }

    return 'failed';
  }
}