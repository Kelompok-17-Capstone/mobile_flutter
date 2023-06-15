import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingPhoneView extends StatefulWidget {
  const SettingPhoneView({super.key});

  @override
  State<SettingPhoneView> createState() => _SettingPhoneViewState();
}

class _SettingPhoneViewState extends State<SettingPhoneView> {

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final currentPhoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    currentPhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentPhoneController.text = Provider.of<AuthProvider>(context, listen: false).user!.phoneNumber;

    return Scaffold(
      appBar: customAppBar(context, title: 'Nomor Telepon', isBackButton: true),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama Lengkap Saat Ini',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              customForm(controller: currentPhoneController, hintText: '', enabled: false),
              const SizedBox(height: 15),
              const Text(
                'Nomor Telepon',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              customForm(controller: phoneController, hintText: 'isi nomer telepon baru Anda', isNumberOnly: true),
              const SizedBox(height: 30),
              fullWidthButton(label: 'Perbarui', onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final String result = await Provider.of<AuthProvider>(context, listen: false).updatePhoneNumber(phoneNumber: phoneController.text.trim());
                  if (result == 'success') {
                    if(!mounted) return;
                    snackBar(context, 'Update nomor telepon sukses');
                    Navigator.pop(context);
                  } else {
                    if(!mounted) return;
                    snackBar(context, result);
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