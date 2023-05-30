import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/custom_colors.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {

  bool isDiscount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, title: 'Rincian Pesanan', isBackButton: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.pin_drop_outlined, color: CustomColors.primary),
                    title: const Text('Alamat Pengiriman', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Rania | 0877-6554-3321', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                        Text('Kos Hadrol, Gang Depan Indomaret, Jl. Terusan SBY No.10, RT.2/RW.3, Kel. Gadingkasri, Kec. Klojen, Kota Malang, Jawa Timur, ID 65115', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300))
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16, color: CustomColors.primary),
                    isThreeLine: true,
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    isThreeLine: true,
                    leading: const Image(image: AssetImage('assets/icons/alta_icon.png'), height: 60),
                    title: const Text(
                      'Blue Alien Curved Monitor 34 Inch',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jumlah: 1', style: TextStyle(color: Colors.grey[800])),
                        const Text(
                          'Rp12.000.000',
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text(
                      'Blue Alien Curved Monitor 34 Inch',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 65,
                          child: Row(
                            children: [
                              Container(
                                color: Colors.grey[100],
                                child: const Image(image: AssetImage('assets/icons/alta_icon.png'), height: 60)
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text('Jumlah: 1', style: TextStyle(color: Colors.grey[800]),),
                                  const Text(
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
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.confirmation_number_outlined, color: CustomColors.primary),
                    title: const Text('Gunakan voucher', style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16, color: CustomColors.primary),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pesan: ',
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Silahkan tinggalkan pesan...',
                              hintStyle: const TextStyle(fontSize: 12),
                              // border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: CustomColors.primary.withOpacity(0.8))
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Pesanan (1 Produk):',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Rp12.000.000',
                          style: TextStyle(
                            color: Color(0xFF264ECA)
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.percent_outlined, color: CustomColors.primary),
                    title: const Text('Diskon 30% sebagai member', style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Switch(
                      activeColor: const Color(0xFF33DF3A),
                      inactiveTrackColor: Colors.grey[300],
                      value: isDiscount,
                      onChanged: (value) {
                        setState(() {
                          isDiscount = value;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.credit_card_outlined, color: CustomColors.primary),
                    title: const Text('Pilih Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16, color: CustomColors.primary),
                  ),
                  const Divider(),
                  ListTile(
                    dense: true,
                    isThreeLine: true,
                    leading: Icon(Icons.receipt_long_outlined, color: CustomColors.primary),
                    title: const Text('Rincian Pembayaran', style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Subtotal untuk produk'),
                            Text('Rp12.000.000')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Subtotal biaya pengiriman'),
                            Text('Rp50.000')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Diskon 30% sebagai member'),
                            Text('-Rp3.600.000')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Total Pembayaran', style: TextStyle(color: Colors.black)),
                            Text('Rp8.450.000', style: TextStyle(color: Color(0xFF264ECA)),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          buyNowButton(
            context,
            leftContent: FittedBox(
              child: TextButton(
                onPressed: () {
                  
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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