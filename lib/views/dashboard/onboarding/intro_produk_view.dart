import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/logo.dart';

class IntroProdukView extends StatelessWidget {
  const IntroProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(image: AssetImage('assets/images/product.png')),
    
          Column(
            children: [
              altaTechLogo(),
              const Text(
                'Detail Produk',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Text(
                'Setiap produk memilikicgambar dan deskripsi untuk mengetahui detail produk',
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