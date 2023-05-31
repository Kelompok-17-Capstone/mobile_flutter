import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {

  final String api = dotenv.env['API']!;

  Future<String> register(String email, String password, String confirmationPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$api/register');
      final data = {
        "email": email,
        "password": password,
        "retype_password": confirmationPassword
      };

      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        prefs.setString('TOKEN', result['token']);
        prefs.setString('status_user', 'unvalidated');
        return 'register success';
      }

    } catch (e) {
      print(e.toString());
    }
    return 'register failed';
  }

  Future<String> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$api/login');

      final data = {
        "email": email,
        "password": password
      };

      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        prefs.setString('TOKEN', result['token']);
        if (result['status_user'] == 'unvalidated') {
          prefs.setString('status_user', 'unvalidated');
          return 'user unvalidated';
        }
        return 'login success';
      }

    } catch (e) {
      print(e.toString());
    }
    return 'login failed';
  }

  Future<String> createProfile({
    required String name,
    required String phoneNumber,
    required String city,
    required String province,
    required String address
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final data = {
        "name": name,
        "phone_number": phoneNumber,
        "city": city,
        "province": province,
        "address": address
      };
      final response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        prefs.setString('status_user', 'validated');
        return 'create profile success';
      }
      
    } catch (e) {
      print(e);
    }
    return 'create profile failed';
  }

  Future<UserModel?> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$api/profile');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return UserModel.fromJson(json: response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


}
