import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/headers.dart';

class ListRiwayatKoin extends StatelessWidget {
  const ListRiwayatKoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              customHeader(
                context,
                title: 'Koin',
                content: Container(
                  margin: const EdgeInsets.only(top: 70),
                  color: Colors.white,
                  width: 380,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/icons/alta_icon.png'),
                        height: 73,
                      ),
                      Text('Alta Tech', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500))
                    ],
                  ),
                )
              ),
              const SizedBox(height: 10),
              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Klaim Sekarang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      isThreeLine: true,
                      leading: Icon(Icons.monetization_on_outlined, color: Colors.orange, size: 40),
                      title: Text(
                        'Cashback 10RB',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF264ECA)
                        ),
                      ),
                      subtitle: Text('Cashback 1% koin dari transaski'),
                      trailing: Text(
                        '+50.000',
                        style: TextStyle(
                          color: Color(0xFFF9A913)
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}