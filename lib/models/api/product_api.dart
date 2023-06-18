import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAPI {
  final String api = dotenv.env['API']!;

  Future<List<ProductModel>> getAllProducts({required String tab, required String price}) async {

    try {
      final url = Uri.parse('$api/products?tab=$tab&price=$price'); // Real API
      //final url = Uri.parse(dotenv.env['DUMMY']!); // Dummy API
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List? result = jsonDecode(response.body)['products'];
        if (result == null) {
          return [];
        }
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

  Future<String> addToCart({required ProductModel product, itemCount = 1}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/cart');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final data = {
        'product_id': product.id,
        'quantity': itemCount
      };

      final response = await http.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        return 'success';
      }

    } catch (e) {
      print(e);
    }

    return 'failed';
  }

  Future<List<ItemCartModel>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.get(Uri.parse('$api/cart'), headers: headers);
      if (response.statusCode == 200) {
        final List? result = jsonDecode(response.body)['data']['detail_cart_item'];
        if (result == null) {
          return [];
        }
        final List<ItemCartModel> cart = result.map((item) {
          final json = jsonEncode(item);
          return ItemCartModel.fromJson(json: json);
        }).toList();
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

  Future<String> deleteCartItem({required int cartId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/cart/$cartId');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        return 'success';
      }
      
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<List<ProductModel>> getFavoriteProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/favorite'); // Real API
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List? result = jsonDecode(response.body)['products'];
        if (result == null) {
          return [];
        }
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

  Future<String> addFavoriteProduct({required String productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/favorite');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'product_id': productId
      };

      final response = await http.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 201) {
        return 'success';
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print(e);
    }

    return 'failed';
  }

  Future<String> deleteFavoriteProduct({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
    final url = Uri.parse('$api/favorite/$id');
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
    };

    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return 'success';
    }
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

}