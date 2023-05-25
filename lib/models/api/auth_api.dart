import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthAPI {

  final String api = 'https://reqres.in/api';

  void register(String email, String password) async {
    try {

      final url = Uri.parse('$api/register');

      final response = await http.post(Uri.parse('https://reqres.in/api/register'), body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
      } else {

      }
    } catch (e) {
      print(e.toString());
    }
  }
}