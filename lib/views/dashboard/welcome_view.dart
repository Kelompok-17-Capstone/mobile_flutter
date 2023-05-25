import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: const Text(
                'Lewati', 
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF264ECA)
                )
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32
                ),
              ),
              const Text(
                'Silahkan daftar akun terlebih dahulu apabila Anda belum punya akun',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF999999)
                ),
              ),
              const Image(
                image: AssetImage('assets/images/welcome.png'),
              ),
              fullWidthButton(label: 'Daftar Akun', onPressed: () {
                
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun?'),
                  const SizedBox(width: 3),
                  const Text('Masuk'),
                  TextButton(
                    onPressed: () {
                    
                    },
                    child: const Text('di sini', style: TextStyle(color: Color(0xFF264ECA)),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}