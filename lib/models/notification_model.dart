import 'dart:convert';

class NotificationModel {
  final int id;
  final String message;
  final bool isRead;
  final String date;

  const NotificationModel({required this.id,  required this.message, required this.isRead, required this.date});

  static NotificationModel fromJson({json}) {
    final data = jsonDecode(json);
    return NotificationModel(
      id: data['id'],
      message: data['text'],
      isRead: data['is_read'],
      date: data['created_at']
    );
  }
}