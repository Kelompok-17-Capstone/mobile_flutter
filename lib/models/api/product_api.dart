import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAPI {
  final String api = dotenv.env['API']!;

  Future<List<ProductModel>> getAllProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      //final url = Uri.parse('$api/admin/products'); // Real API
      final url = Uri.parse(dotenv.env['DUMMY']!);
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      // final response = await http.get(url, headers: headers); // Real Response
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

}