import 'package:flutter/material.dart';
import 'package:mobile_flutter/arguments/detail_notification_view_argument.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Notifikasi', isBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('16 Mei 2023'),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail_notification',
                      arguments: const DetailNotificationViewArgument(
                        date: '16 Mei 2023',
                        message: 'Selamat! Anda mendapatkan bonus saldo sebesar Rp10.000 karena telah mendaftarkan akun di aplikasi mobile AltaTech'
                      )
                    );
                  },
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Selamat! Anda mendapatkan bonus saldo sebesar Rp10.000 karena telah mendaftarkan akun di aplikasi mobile AltaTech',
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