// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/notification_api.dart';
import 'package:mobile_flutter/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  void getNotification() async {
    final api = NotificationAPI();
    final List<NotificationModel> result = await api.getNotification();
    if (result.isNotEmpty) {
      _notifications = result;
      notifyListeners();
    }
  }

  Future<String> messageRead({required int id}) async {
    final api = NotificationAPI();
    final String result = await api.messageRead(id: id);
    if (result == 'success') {
      getNotification();
    }
    print(result);
    return result;
  }
}