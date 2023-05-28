import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/headers.dart';

class PersonalFormView extends StatefulWidget {
  const PersonalFormView({super.key});

  @override
  State<PersonalFormView> createState() => _PersonalFormViewState();
}

class _PersonalFormViewState extends State<PersonalFormView> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    stateController.dispose();
    cityController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formLabel(label: 'Nama Lengkap'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'data sesuai KTP'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Nomor Telepon'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'isi nomer yang aktif', isNumberOnly: true),
                      const SizedBox(height: 10),
                      formLabel(label: 'Provinsi'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'isi sesuai domisili'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Kabupaten/Kota'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'isi sesuai domisili'),
                      const SizedBox(height: 10),
                      formLabel(label: 'Alamat'),
                      const SizedBox(height: 5),
                      customForm(controller: nameController, hintText: 'isi beserta kecamatan & kode pos', maxLines: 3),
                      const SizedBox(height: 20),
                      fullWidthButton(label: 'Submit', onPressed: () {
                        
                      },),
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