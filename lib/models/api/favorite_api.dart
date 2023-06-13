import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobile_flutter/models/favorite_model.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  static const apiEndpoint = 'https://fake-api-capstone.xnin069.repl.co';

  String error = '';
  FavoriteModel favorite = const FavoriteModel(
      id: 'id',
      name: 'name',
      description: 'description',
      stock: 0,
      price: 0,
      imgUrl: 'imgUrl');

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        favorite = jsonDecode(response.body)['favorite'];
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }
}
