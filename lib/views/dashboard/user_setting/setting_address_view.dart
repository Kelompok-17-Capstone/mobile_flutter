import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_address_form_view.dart';
import 'package:provider/provider.dart';

class SettingAddressView extends StatefulWidget {
  const SettingAddressView({super.key});

  @override
  State<SettingAddressView> createState() => _SettingAddressViewState();
}

class _SettingAddressViewState extends State<SettingAddressView> {

  @override
  Widget build(BuildContext context) {
    final List<UserAddress> userAddress = Provider.of<AuthProvider>(context, listen: false).user!.address;

    return Scaffold(
      appBar: customAppBar(context, title: 'Alamat Pengiriman', isBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userAddress.length,
                itemBuilder: (context, index) {
                  final UserAddress address = userAddress[index];
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            address.status ? 'Alamat Utama' : 'Alamat Lainnya',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          subtitle: Text(
                            address.address,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300
                            ),
                          ),
                          trailing: const Icon(Icons.navigate_next_outlined, color: Color(0xFF264ECA)),
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              ),
              Container(
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => SettingAddressFormView(title: 'Edit Alamat', address: userAddress.first)));
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    elevation: MaterialStatePropertyAll(0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_circle_outline, color: Color(0xFF264ECA),),
                      Text('Tambah Alamat Baru', style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}