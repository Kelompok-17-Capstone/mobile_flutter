import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Pengaturan', isBackButton: true),
      body: Column(
        children: [
          customListTile(
            icon: Icons.email_outlined,
            title: 'Alamat Email',
            onTap: () {
              Navigator.pushNamed(context, '/setting_email');
            },
          ),
          customListTile(
            icon: Icons.key_outlined,
            title: 'Kata Sandi',
            onTap: () {
              Navigator.pushNamed(context, '/setting_password');
            },
          ),
          customListTile(
            icon: Icons.person_outline,
            title: 'Nama Lengkap',
            onTap: () {
              Navigator.pushNamed(context, '/setting_name');
            },
          ),
          customListTile(
            icon: Icons.call_outlined,
            title: 'Nomor Telepon',
            onTap: () {
              Navigator.pushNamed(context, '/setting_phone');
            },
          ),
          customListTile(
            icon: Icons.pin_drop_outlined,
            title: 'Alamat Pengiriman',
            onTap: () {
              Navigator.pushNamed(context, '/setting_address');
            },
          ),
        ],
      ),
    );
  }

  Container customListTile({required IconData icon, required String title, void Function()? onTap}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.1))
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.black.withOpacity(0.8),
        ),
        title: Text(title),
        trailing: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF264ECA).withOpacity(0.3),
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
      ),
    );
  }
}