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

  Future<String> registerMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final response = await http.put(url, headers: headers);
      if (response.statusCode == 200) {
        return 'success';
      }
      
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<String> uploadPicture({required String imagePath}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/photo');

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = 'Bearer ${prefs.getString('TOKEN')}';
      request.files.add(
        await http.MultipartFile.fromPath('image', imagePath)
      );
      
      final response = await request.send();
      if (response.statusCode == 200) {
        return 'success';
      }

    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<String> topupBalance({required int balance}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/topup');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'total': balance
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

  Future<String> addAddress({required String province, required String city, required String address}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/address');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'address' : address,
        'city' : city,
        'province' : province
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

  Future<String> editAddress({required int addressId, required String province, required String city, required String address, required bool isPrimaryAddress}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/address/$addressId');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'status': isPrimaryAddress
      };
      if (province.isNotEmpty) {
        data.addEntries({'province': province}.entries); 
      }
      if (city.isNotEmpty) {
        data.addEntries({'city': city}.entries);
      }
      if (address.isNotEmpty) {
        data.addEntries({'address': address}.entries);
      }

      final response = await http.put(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print(e);
      
    }
    return 'failed';
  }

  Future<String> deleteAddress({required int addressId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/address/$addressId');
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };


      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return jsonDecode(response.body)['message'];
      }
    } catch (e) {
      print(e);
      
    }
    return 'failed';
  }

  Future<String> updateEmail({required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/email');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'email': email
      };

      final response = await http.put(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return 'success';
      }
      print(response.body);
      return jsonDecode(response.body)['message'];
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<String> updateName({required String name}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/name');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'name': name
      };

      final response = await http.put(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return 'success';
      }
      print(response.body);
      return jsonDecode(response.body)['message'];
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<String> updatePhoneNumber({required String phoneNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/phone-number');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'phone_number': phoneNumber
      };

      final response = await http.put(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return 'success';
      }
      print(response.body);
      return jsonDecode(response.body)['message'];
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  Future<String> changePassword({required String currentPassword, required String newPassword, required String newConfirmationPassword}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/profile/password');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };
      final Map data = {
        'old_password': currentPassword,
        'new_password': newPassword,
        'retype_password': newConfirmationPassword
      };

      final response = await http.put(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return 'success';
      }
      print(response.body);
      return jsonDecode(response.body)['message'];
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

}
