import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/custom_colors.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  final List<ItemCartModel> cart;
  const CheckoutView({super.key, required this.cart});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {

  late UserModel user;

  final noteController = TextEditingController();
  bool isCoinEnabled = false;

  @override
  void initState() {
    super.initState();
    user = Provider.of<AuthProvider>(context, listen: false).user!;
  }

  int countTotalPayment({required int totalProduct, required int shippingCost}) {
    int discount = isCoinEnabled ? user.coin : 0;
    return (totalProduct + shippingCost - discount).ceil();
  }

  @override
  void dispose() {
    super.dispose();
    noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<ItemCartModel> items = Provider.of<CartProvider>(context).items;
    // final int amount = Provider.of<CartProvider>(context).amount;
    // final int totalProduct = Provider.of<CartProvider>(context).totalProduct;

    int amountProuct() {
      int result = 0;
      for (var element in widget.cart) {
        result += element.itemCount;
      }
      return result;
    }

    int totalProduct() {
      int result = 0;
      for (var item in widget.cart) {
        result += item.product.price * item.itemCount;
      }
      return result;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, title: 'Rincian Pesanan', isBackButton: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.pin_drop_outlined, color: CustomColors.primary),
                      title: const Text('Alamat Pengiriman', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                      subtitle: Text(user.address.where((element) => element.selected = true).first.address, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16, color: CustomColors.primary),
                      isThreeLine: true,
                    ),
                    const Divider(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.cart.length,
                      itemBuilder: (context, index) {
                        final ItemCartModel item = widget.cart[index];
                        return ListTile(
                          isThreeLine: true,
                          leading: Image(image: NetworkImage(item.product.imgUrl), height: 60),
                          title: Text(
                            item.product.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jumlah: ${item.itemCount}', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w300)),
                              Text(
                                formatRupiah(item.getSubTotal()),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          ),
                        );
                        
                      },
                    ),
                    // ListTile(
                    //   dense: true,
                    //   title: const Text(
                    //     'Blue Alien Curved Monitor 34 Inch',
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w500
                    //     ),
                    //   ),
                    //   subtitle: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         height: 65,
                    //         child: Row(
                    //           children: [
                    //             Container(
                    //               color: Colors.grey[100],
                    //               child: const Image(image: AssetImage('assets/icons/alta_icon.png'), height: 60)
                    //             ),
                    //             const SizedBox(width: 20),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 const Spacer(),
                    //                 Text('Jumlah: 1', style: TextStyle(color: Colors.grey[800]),),
                    //                 const Text(
                    //                   'Rp12.000.000',
                    //                   style: TextStyle(
                    //                     color: Colors.grey
                    //                   ),
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const Divider(),

                    ListTile(
                      dense: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Nama: ', style: TextStyle(color: Colors.black)),
                          Text(user.name, style: const TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Nomor Telepon: ', style: TextStyle(color: Colors.black)),
                          Text(user.phoneNumber, style: const TextStyle(color: Colors.black))
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pesanan (${amountProuct()} produk)',
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            formatRupiah(totalProduct()),
                            style: const TextStyle(
                              color: Color(0xFF264ECA),
                              fontWeight: FontWeight.w500
                            ),
                          )
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
                      leading: Icon(Icons.confirmation_number_outlined, color: CustomColors.primary),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Saldo Anda', style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(formatRupiah(user.balance), style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF264ECA)))
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.percent_outlined, color: CustomColors.primary),
                      title: Text('Tukarkan ${user.coin} koin', style: const TextStyle(fontWeight: FontWeight.w500)),
                      trailing: Switch(
                        activeColor: const Color(0xFF33DF3A),
                        inactiveTrackColor: Colors.grey[300],
                        value: isCoinEnabled,
                        onChanged: (value) {
                          setState(() {
                            isCoinEnabled = value;
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
                            children: [
                              const Text('Subtotal untuk produk'),
                              Text(formatRupiah(totalProduct()))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Subtotal biaya pengiriman (gratis ongkir)'),
                              Text('Rp0')
                            ],
                          ),
                          !isCoinEnabled
                          ? const SizedBox()
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Tukar Koin'),
                              Text(formatRupiah(user.coin))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Pembayaran', style: TextStyle(color: Colors.black)),
                              Text(formatRupiah(countTotalPayment(totalProduct: totalProduct(), shippingCost: 0)), style: const TextStyle(color: Color(0xFF264ECA)))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
                  children: [
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    Text(
                      formatRupiah(countTotalPayment(totalProduct: totalProduct(), shippingCost: 0)),
                      style: const TextStyle(
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