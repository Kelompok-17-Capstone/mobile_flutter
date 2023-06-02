import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/form.dart';

class SettingPasswordView extends StatefulWidget {
  const SettingPasswordView({super.key});

  @override
  State<SettingPasswordView> createState() => _SettingPasswordViewState();
}

class _SettingPasswordViewState extends State<SettingPasswordView> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
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
                'Email Saat Ini',
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
              }),
              const SizedBox(height: 15),
              const Text(
                'Email Baru',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              passwordForm(controller: confirmationPasswordController, isPasswordVisible: isPasswordVisible, onPressed:() {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },),
              const SizedBox(height: 30),
              fullWidthButton(label: 'Perbarui', onPressed: () {
                
              })
            ],
          ),
        ),
      )
    );
  }
}