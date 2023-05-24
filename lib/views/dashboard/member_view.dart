import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class MemberView extends StatelessWidget {
  const MemberView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2649CA), Colors.black]
                  )
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width * 0.2,
                            child: const Image(
                              image: AssetImage('assets/icons/alta_icon.png'),
                            ),
                          ),
                          const Text(
                            'rania alatas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        onPressed: () {
                          
                        },
                        icon: const Icon(Icons.manage_accounts_outlined, size: 32, color: Colors.white,),
                      ),
                    )
                  ],
                ),
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
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size.fromHeight(56)),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFF264ECA))
                      ),
                      child: const Text('Daftar Member'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}