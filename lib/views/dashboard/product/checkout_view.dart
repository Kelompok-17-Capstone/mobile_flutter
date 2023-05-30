import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: customAppBar(context, title: 'Rincian Pesanan', isBackButton: true),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.pin_drop_outlined),
                  title: const Text('Alamat Pengiriman'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Rania | 0877-6554-3321', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                      Text('Kos Hadrol, Gang Depan Indomaret, Jl. Terusan SBY No.10, RT.2/RW.3, Kel. Gadingkasri, Kec. Klojen, Kota Malang, Jawa Timur, ID 65115', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300))
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
                  isThreeLine: true,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Blue Alien Curved Monitor 34 Inch',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 65,
                        child: Row(
                          children: [
                            const Image(image: AssetImage('assets/icons/alta_icon.png'), height: 60,),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Jumlah: 1'),
                                Text(
                                  'Rp12.000.000',
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  dense: true,
                  leading: Icon(Icons.confirmation_number_outlined),
                  title: Text('Gunakan voucher', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                ),
                const Divider(),
                ListTile(
                  dense: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Pesan: '
                      ),
                      Text(
                        'Silahkan tinggalkan pesan...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8
                        ),
                      )
                    ],
                  ),
                ),
                const Divider()
              ],
            ),
          ),
          buyNowButton(
            context,
            leftContent: FittedBox(
              child: TextButton(
                onPressed: () {
                  
                },
                child: Column(
                  children: const [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    Text(
                      'Rp8.450.000',
                      style: TextStyle(
                        color: Color(0xFF264ECA)
                      ),
                    )
                  ],
                ),
              ),
            ),
            labelButton: 'Lakukan Pembayaran',
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}