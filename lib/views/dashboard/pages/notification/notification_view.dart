import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/arguments/detail_notification_view_argument.dart';
import 'package:mobile_flutter/models/notification_model.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = Provider.of<NotificationProvider>(context).notifications;
    return Scaffold(
      appBar: customAppBar(context, title: 'Notifikasi', isBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: notifications.isEmpty
        ? const Center(child: Text('Saat ini tidak ada notifikasi'))
        : ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final NotificationModel notification = notifications[index];
            final date = DateFormat('d MMMM y').format(DateTime.parse(notification.date));
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail_notification',
                      arguments: DetailNotificationViewArgument(index: index)
                    );
                  },
                  child: Stack(
                    children: [
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notification.message,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF264ECA).withOpacity(0.1),
                                  border: Border.all(
                                    color: const Color(0xFF264ECA)
                                  ),
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: const Icon(
                                  Icons.arrow_right_alt_outlined, 
                                  color: Color(0xFF264ECA),
                                  size: 15,
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 6,
                          width: 6,
                          padding: const EdgeInsets.all(2),
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            );
          },
        ),
      ),
    );
  }
}