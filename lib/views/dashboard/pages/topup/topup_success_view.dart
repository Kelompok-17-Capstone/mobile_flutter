import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';

class TopupSuccessView extends StatelessWidget {
  const TopupSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
            const Text(
              'Top-up saldo dengan Dana telah berhasil. Nikmati cashback 1% koin dari nominal top-up saldo Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey
              ),
            ),
            const SizedBox(height: 50),
            const Image(image: AssetImage('assets/images/topup.png')),
            const SizedBox(height: 100),
            fullWidthButton(label: 'Lihat Koin', onPressed: () {
      
            }),
            const SizedBox(height: 20),
            fullWidthButton(label: 'Dashboard', onPressed: () {
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}