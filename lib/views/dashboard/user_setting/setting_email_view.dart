import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/form.dart';

class SettingEmailView extends StatefulWidget {
  const SettingEmailView({super.key});

  @override
  State<SettingEmailView> createState() => _SettingEmailViewState();
}

class _SettingEmailViewState extends State<SettingEmailView> {

  final formKey = GlobalKey<FormState>();
  final currentEmailController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentEmailController.text = 'yourcurrentemail@gmail.com';
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Alamat Email', isBackButton: true),
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
              customForm(controller: currentEmailController, hintText: 'current email', enabled: false),
              const SizedBox(height: 15),
              const Text(
                'Email Baru',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              emailForm(controller: emailController),
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