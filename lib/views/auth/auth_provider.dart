import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/auth_api.dart';
import 'package:mobile_flutter/models/user/user_model.dart';

class AuthProvider extends ChangeNotifier {

  late UserModel user;

  Future<String> register({required String email, required String password, required String confirmationPassword}) async {
    final auth = AuthAPI();
    String result = await auth.register(email, password, confirmationPassword);
    if (result == 'register success') {
      user = UserModel(
        fullName: 'Full Name', 
        email: 'Email', 
        phone: '089500000000', 
        address: 'Dago, Bandung, Jawa Barat'
      );
      return 'register success';
    }

    return 'register failed';
  }

}