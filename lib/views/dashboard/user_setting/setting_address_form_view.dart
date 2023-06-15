import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class SettingAddressFormView extends StatefulWidget {
  final String title;
  final UserAddress address;
  const SettingAddressFormView({super.key, required this.title, required this.address});

  @override
  State<SettingAddressFormView> createState() => _SettingAddressFormViewState();
}

class _SettingAddressFormViewState extends State<SettingAddressFormView> {

  final formKey = GlobalKey<FormState>();
  final provinceController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  bool isPrimaryAddress = false;

  @override
  void initState() {
    isPrimaryAddress = widget.address.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: widget.title, isBackButton: true),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: const Text(
                  'Alamat saat ini',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                subtitle: Text(
                  widget.address.address,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: provinceController,
                    decoration: InputDecoration(
                      hintText: 'Provinsi',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'Kota/Kabupaten',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: 'Alamat beserta Kecamatan',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: const Text('Pengaturan', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400)),
                subtitle: const Text('Jadikan alamat utama'),
                trailing: Switch(
                  activeColor: const Color(0xFF33DF3A),
                  inactiveTrackColor: Colors.grey[300],
                  value: isPrimaryAddress,
                  onChanged: (value) {
                    setState(() {
                      isPrimaryAddress = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  
                },
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size.fromHeight(56))
                ),
                child: const Text(
                  'Hapus Alamat',
                  style: TextStyle(
                    color: Color(0xFF264ECA),
                    fontWeight: FontWeight.w400
                  )
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: fullWidthButton(label: 'Simpan', onPressed: () {}),
            )
          ],
        ),
      )
    );
  }
}