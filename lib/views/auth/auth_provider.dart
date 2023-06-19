import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart'; 
import 'package:path/path.dart' as path;
import 'package:open_file/open_file.dart';

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/auth_api.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {
  none,
  loading,
  failed
}


class AuthProvider extends ChangeNotifier {

  UserModel? _user;
  AuthState _state = AuthState.none;

  UserModel? get user => _user;
  AuthState get state => _state;

  void setState({required AuthState state}) {
    _state = state;
    notifyListeners();
  }

  Future<String> isLoggedIn() async {
    setState(state: AuthState.loading);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(state: AuthState.none);
    if (prefs.getString('TOKEN') != null) {
      if (prefs.getString('status_user') == 'unvalidated') {
        return 'unvalidated';
      }
      await getProfile();
      return 'validated';
    }
    return 'failed';
  }

  Future<String> register({required String email, required String password, required String confirmationPassword}) async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    String result = await auth.register(email, password, confirmationPassword);
    if (result == 'register success') {
      await getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> login({required String email, required String password}) async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    String result = await auth.login(email, password);
    if (result == 'login success') {
      await getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> createProfile({
    required String name,
    required String phoneNumber,
    required String city,
    required String province,
    required String address
  }) async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    String result = await auth.createProfile(name: name, phoneNumber: phoneNumber, city: city, province: province, address: address);
    await getProfile();
    setState(state: AuthState.none);
    return result;
  }

  Future<void> getProfile() async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    final UserModel? result = await auth.getProfile();
    if (result != null) {
      _user = result;
    }
    setState(state: AuthState.none);
  }

  Future<String> registerMember() async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    final result = await auth.registerMember();
    if (result == 'success') {
      await getProfile();
      notifyListeners();
    }
    setState(state: AuthState.none);
    return result;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _user = null;
  }

  Future<String> uploadPicture({required String imagePath}) async {
    setState(state: AuthState.loading);
    final auth = AuthAPI();
    final result = await auth.uploadPicture(imagePath: imagePath);
    if (result == 'success') {
      getProfile(); 
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> topupBalance({required int balance}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.topupBalance(balance: balance);
    if (result == 'success') {
      getProfile(); 
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> addAddress({required String province, required String city, required String address}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.addAddress(province: province, city: city, address: address);
    if (result == 'success') {
      getProfile(); 
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> editAddress({required int addressId, required String province, required String city, required String address, required bool isPrimaryAddress}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.editAddress(addressId: addressId, province: province, city: city, address: address, isPrimaryAddress: isPrimaryAddress);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> deleteAddress({required int addressId}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.deleteAddress(addressId: addressId);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> updateEmail({required String email}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.updateEmail(email: email);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> updateName({required String name}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.updateName(name: name);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> updatePhoneNumber({required String phoneNumber}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.updatePhoneNumber(phoneNumber: phoneNumber);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> changePassword({required String currentPassword, required String newPassword, required String newConfirmationPassword}) async {
    setState(state: AuthState.loading);
    final api = AuthAPI();
    final String result = await api.changePassword(currentPassword: currentPassword, newPassword: newPassword, newConfirmationPassword: newConfirmationPassword);
    if (result == 'success') {
      getProfile();
    }
    setState(state: AuthState.none);
    return result;
  }

  Future<String> saveMemberCard({required Uint8List bytes}) async {
    setState(state: AuthState.loading);
    try {
      Directory? externalStorageDirectory = await getExternalStorageDirectory();
      File file = File(path.join(externalStorageDirectory!.path, path.basename('membercard.png')));
      await file.writeAsBytes(bytes);
      OpenFile.open(file.absolute.path);
      setState(state: AuthState.none);
      return 'success';
    } catch (e) {
      print(e);
    }
    setState(state: AuthState.none);
    return 'failed';
  }

}