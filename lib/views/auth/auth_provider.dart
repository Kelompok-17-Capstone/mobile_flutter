import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/auth_api.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {

  late UserModel _user;

  UserModel get user => _user;

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('TOKEN') != null) {
      _user = UserModel(
        fullName: 'Full Name', 
        email: 'Email', 
        phone: '089500000000', 
        address: 'Dago, Bandung, Jawa Barat'
      );
      return true;
    }
    return false;
  }

  Future<String> register({required String email, required String password, required String confirmationPassword}) async {
    final auth = AuthAPI();
    String result = await auth.register(email, password, confirmationPassword);
    if (result == 'register success') {
      _user = UserModel(
        fullName: 'Full Name', 
        email: 'Email', 
        phone: '089500000000', 
        address: 'Dago, Bandung, Jawa Barat'
      );
      return 'register success';
    }

    return 'register failed';
  }

  Future<String> login({required String email, required String password}) async {
    final auth = AuthAPI();
    String result = await auth.login(email, password);
    if (result == 'login success') {
      _user = UserModel(
        fullName: 'Full Name', 
        email: 'Email', 
        phone: '089500000000', 
        address: 'Dago, Bandung, Jawa Barat'
      );
      return 'login success';
    }

    return 'login failed';
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('TOKEN');
  }



}