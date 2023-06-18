import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/logo.dart';

class IntroDaftarView extends StatelessWidget {
  const IntroDaftarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage('assets/images/daftar.png')),
    
          Column(
            children: [
              altaTechLogo(),
              const Text(
                'Daftar Member',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Text(
                'Nikmati fitur koin dan dapatkan berbagai keuntungannya',
                textAlign: TextAlign.center,
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