import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/logo.dart';

class IntroInformasiView extends StatelessWidget {
  const IntroInformasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage('assets/images/informasi.png')),
    
          Column(
            children: [
              altaTechLogo(),
              const Text(
                'Informasi Member',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Text(
                'Gunakan barcode khusus member untuk menikmati diskon 30%',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}