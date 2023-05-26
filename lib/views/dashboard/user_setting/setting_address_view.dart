import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/form.dart';

class SettingAddressView extends StatefulWidget {
  const SettingAddressView({super.key});

  @override
  State<SettingAddressView> createState() => _SettingAddressViewState();
}

class _SettingAddressViewState extends State<SettingAddressView> {

  final formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Alamat Pengiriman', isBackButton: true),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alamat Pengiriman',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              customForm(controller: addressController, hintText: 'alamat pengiriman', maxLines: 3),
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