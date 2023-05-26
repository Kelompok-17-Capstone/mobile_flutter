import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/header.dart';

class MemberView extends StatelessWidget {
  const MemberView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(context, title: 'Informasi Member', isElevated: false),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  profileHeader(context),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/user_setting');
                      },
                      icon: const Icon(Icons.manage_accounts_outlined, size: 32, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text('Silahkan mendaftar sebagai member dan nikmati diskon 30% untuk setiap transaksi serta dapatkan keuntungan lainnya'),
                    const SizedBox(height: 30),
                    BarcodeWidget(
                      color: Colors.grey,
                      height: 100,
                      barcode: Barcode.code128(),
                      data: '00000 000000',
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 50),
                    fullWidthButton(label: 'Daftar Member', onPressed: () {
                      
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}