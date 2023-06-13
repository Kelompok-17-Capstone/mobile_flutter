import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAPI {
  final String api = dotenv.env['API']!;

  Future<List<ProductModel>> getAllProducts() async {

    try {
      final url = Uri.parse('$api/products'); // Real API
      //final url = Uri.parse(dotenv.env['DUMMY']!); // Dummy API
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['products'];
        final List<ProductModel> products = result.map((item) {
          final json = jsonEncode(item);
          return ProductModel.fromJson(json: json);
        }).toList();
        return products;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<ItemCartModel>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.get(Uri.parse('$api/cart'), headers: headers);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data']['detail_cart_item'];
        final List<ItemCartModel> cart = await Future.wait(result.map((item) async {
          final json = jsonEncode(item);
          final getProductDetail = await http.get(Uri.parse('$api/products/${item['product_id']}'));
          final ProductModel product = ProductModel.fromJson(json: jsonEncode(jsonDecode(getProductDetail.body)['data']));
          return ItemCartModel.fromJson(json: json, product: product);
        }).toList());
        return cart;
      }
      
    } catch (e) {
      print(e);
    }

    return [];
  }

  Future<String> updateItemCount({required int cartId, required int count}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    try {
      final url = Uri.parse('$api/cart/$cartId');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final data = {
        'quantity': count
      };

      final response = await http.put(url, headers: headers, body: jsonEncode(data));
      print(response.body);
      if (response.statusCode == 200) {
        return 'success';
      }
      
    } catch (e) {
      print(e);
    }

    return 'failed';
  }

}