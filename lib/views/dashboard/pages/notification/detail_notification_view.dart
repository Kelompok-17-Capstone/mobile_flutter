import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/models/notification_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/notification_provider.dart';
import 'package:provider/provider.dart';

class DetailNotificationView extends StatelessWidget {
  final int index;

  const DetailNotificationView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final NotificationModel notification = Provider.of<NotificationProvider>(context, listen: false).notifications[index];
    if (!notification.isRead) {
      Provider.of<NotificationProvider>(context, listen: false).messageRead(id: notification.id);
    }
    final date = DateFormat('d MMMM y').format(DateTime.parse(notification.date));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 253,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF2649CA),
                          Colors.black,
                        ],
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage('assets/icons/alta_icon_white.png'),
                        ),
                        Text(
                          'Alta Tech',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                  AppBar(
                    leading: customBackButton(context, color: Colors.white),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date),
                    const Divider(),
                    Text(notification.message)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}