import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingPasswordView extends StatefulWidget {
  const SettingPasswordView({super.key});

  @override
  State<SettingPasswordView> createState() => _SettingPasswordViewState();
}

class _SettingPasswordViewState extends State<SettingPasswordView> {

  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  bool isCurrentPasswordVisible = false;
  bool isPasswordVisible = false;
  bool isConfirmationPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Password', isBackButton: true),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kata sandi saat ini',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              passwordForm(controller: currentPasswordController, isPasswordVisible: isCurrentPasswordVisible, onPressed:() {
                setState(() {
                  isCurrentPasswordVisible = !isCurrentPasswordVisible;
                });
              }),
              const SizedBox(height: 15),
              const Text(
                'Kata sandi baru',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              passwordForm(controller: passwordController, isPasswordVisible: isPasswordVisible, onPressed:() {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },),
              const SizedBox(height: 15),
              const Text(
                'Konfirmasi kata sandi baru ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              passwordForm(controller: confirmationPasswordController, isPasswordVisible: isConfirmationPasswordVisible, onPressed:() {
                setState(() {
                  isConfirmationPasswordVisible = !isConfirmationPasswordVisible;
                });
              }),
              const SizedBox(height: 15),
              const SizedBox(height: 30),
              fullWidthButton(label: 'Perbarui', onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (passwordController.text.trim() != confirmationPasswordController.text.trim()) {
                    snackBar(context, 'Pastikan password dan konfirmasi password sama');
                  } else {
                    final String result = await Provider.of<AuthProvider>(context, listen: false).changePassword(
                      currentPassword: currentPasswordController.text.trim(),
                      newPassword: passwordController.text.trim(),
                      newConfirmationPassword: confirmationPasswordController.text.trim()
                    );
                    if (result == 'success') {
                      if(!mounted) return;
                      snackBar(context, 'Ganti password berhasil');
                      Navigator.pop(context);
                    } else {
                      if(!mounted) return;
                      snackBar(context, result);
                    }
                  }
                }
              })
            ],
          ),
        ),
      )
    );
  }
}