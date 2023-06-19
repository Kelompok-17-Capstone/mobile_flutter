import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SettingAddressFormView extends StatefulWidget {
  final bool isEditAddress;
  final UserAddress address;
  const SettingAddressFormView({super.key, required this.isEditAddress, required this.address});

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
      appBar: customAppBar(context, title: widget.isEditAddress ? 'Edit Alamat' : 'Alamat Baru', isBackButton: true),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            !widget.isEditAddress
            ? const SizedBox()
            : Container(
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
                    validator: widget.isEditAddress ? (value) => null : (value) {
                      if (value!.isEmpty) {
                        return 'Isi provinsi terlebih dahulu';
                      }
                      return null;
                    },
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
                    validator: widget.isEditAddress ? (value) => null : (value) {
                      if (value!.isEmpty) {
                        return 'Isi kota/kabupaten terlebih dahulu';
                      }
                      return null;
                    },
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
                    validator: widget.isEditAddress ? (value) => null : (value) {
                      if (value!.isEmpty) {
                        return 'Isi alamat lengkap terlebih dahulu';
                      }
                      return null;
                    },
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
            
            !widget.isEditAddress
            ? const SizedBox()
            : Container(
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
                  key: const Key('primary-switch'),
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

            !widget.isEditAddress
            ? const SizedBox()
            : Container(
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
                key: const Key('hapus-alamat-button'),
                onPressed: () async {
                  final String result = await Provider.of<AuthProvider>(context, listen: false).deleteAddress(addressId: widget.address.id);
                  if (result == 'success') {
                    if(!mounted) return;
                    snackBar(context, 'Hapus alamat success');
                    Navigator.pop(context);
                  } else {
                    if(!mounted) return;
                    snackBar(context, result);
                  }
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
              child: fullWidthButton(label: 'Simpan', onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (widget.isEditAddress) {
                    final String result = await Provider.of<AuthProvider>(context, listen: false).editAddress(
                      addressId: widget.address.id,
                      province: provinceController.text.trim(),
                      city: cityController.text.trim(),
                      address: addressController.text.trim(),
                      isPrimaryAddress: isPrimaryAddress
                    );
                    if (result == 'success') {
                      if(!mounted) return;
                      snackBar(context, 'Edit alamat berhasil.');
                      Navigator.pop(context);
                    } else {
                      if(!mounted) return;
                      snackBar(context, result);
                    }
                  } else {
                    final String result = await Provider.of<AuthProvider>(context, listen: false).addAddress(
                      province: provinceController.text.trim(),
                      city: cityController.text.trim(),
                      address: addressController.text.trim()
                    );
                    if (result == 'success') {
                      if(!mounted) return;
                      snackBar(context, 'Tambah alamat berhasil.');
                      Navigator.pop(context);
                    } else {
                      if(!mounted) return;
                      snackBar(context, 'Tambah alamat gagal, silahkan coba lagi.');
                    }
                  }
                }
              }),
            )
          ],
        ),
      )
    );
  }
}