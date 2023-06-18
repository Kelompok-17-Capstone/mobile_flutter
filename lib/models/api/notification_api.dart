import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_flutter/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationAPI {
  final String api = dotenv.env['API']!;

  Future<List<NotificationModel>> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final url = Uri.parse('$api/notifications');
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.getString('TOKEN')}'
      };

      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        final List<NotificationModel> history = result.map((element) {
          final json = jsonEncode(element);
          return NotificationModel.fromJson(json: json);
        }).toList();
        return history;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }
}