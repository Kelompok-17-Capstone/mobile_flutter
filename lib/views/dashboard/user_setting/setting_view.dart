import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Pengaturan', isBackButton: true, actions: [
        IconButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Logout'),
                  content: const Text(
                    'Are you sure you want to logout?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false).logout();
                        Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                      },
                      child: const Text('Logout', style: TextStyle(color: Color(0xFF264ECA))),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.logout_outlined, color: const Color(0xFF264ECA).withOpacity(0.8)),
        )
      ]),
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
      ),
    );
  }
}