import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class PersonalFormView extends StatefulWidget {
  const PersonalFormView({super.key});

  @override
  State<PersonalFormView> createState() => _PersonalFormViewState();
}

class _PersonalFormViewState extends State<PersonalFormView> {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final provinceController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    provinceController.dispose();
    cityController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthState state = Provider.of<AuthProvider>(context).state;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                customHeaderWithIcon(title: 'Data Pribadi'),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formLabel(label: 'Nama Lengkap'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'data sesuai KTP'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Nomor Telepon'),
                      const SizedBox(height: 5),
                      customForm(controller: phoneController, hintText: 'isi nomer yang aktif', isNumberOnly: true),
                      const SizedBox(height: 10),
                      formLabel(label: 'Provinsi'),
                      const SizedBox(height: 5),
                      customForm(controller: provinceController, hintText: 'isi sesuai domisili'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Kabupaten/Kota'),
                      const SizedBox(height: 5),
                      customForm(controller: cityController, hintText: 'isi sesuai domisili'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Alamat'),
                      const SizedBox(height: 5),
                      customForm(controller: addressController, hintText: 'isi beserta kecamatan & kode pos', maxLines: 3),
                      const SizedBox(height: 20),
                      state == AuthState.loading
                      ? Center(child: CircularProgressIndicator(color: const Color(0xFF264ECA).withOpacity(0.8)))
                      : fullWidthButton(label: 'Submit', onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final String result = await Provider.of<AuthProvider>(context, listen: false).createProfile(
                            name: nameController.text.trim(),
                            phoneNumber: phoneController.text,
                            city: cityController.text.trim(),
                            province: provinceController.text.trim(),
                            address: addressController.text.trim()
                          );
                          if (result == 'success') {
                            if(!mounted) return;
                            Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false);
                          } else {
                            if(!mounted) return;
                            snackBar(context, result);
                          }
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}