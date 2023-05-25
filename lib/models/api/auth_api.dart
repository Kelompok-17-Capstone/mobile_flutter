import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {

  final String api = 'https://reqres.in/api';

  Future<String> register(String email, String password, String confirmationPassword) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final url = Uri.parse('$api/register');
      final data = {
        "email": email,
        "password": password,
        //"retype_password": confirmationPassword
      };

      final response = await http.post(url, body: data);
      print(response.body);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        prefs.setString('token', result['token']);
        return 'register success';
      }

    } catch (e) {
      print(e.toString());
    }
    return 'register failed';
  }
}