import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/models/product_model.dart';

class ProductAPI {
  final String api = dotenv.env['API']!;

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final url = Uri.parse('$api/admin/products');
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