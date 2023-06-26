import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/item_cart_model.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/custom_colors.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/notification_provider.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/orders_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  final List<ItemCartModel> cart;
  final bool isCart;
  const CheckoutView({super.key, required this.cart, required this.isCart});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {

  late UserModel user;

  bool isCoinEnabled = false;

  @override
  void initState() {
    super.initState();
    user = Provider.of<AuthProvider>(context, listen: false).user!;
  }

  int countTotalPayment({required int totalProduct, required int shippingCost}) {
    int coin = isCoinEnabled ? user.coin >= totalProduct ? totalProduct : user.coin : 0;
    return (totalProduct + shippingCost - coin).ceil();
  }


  @override
  Widget build(BuildContext context) {

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
        result += item.productPrice * item.itemCount;
      }
      return result;
    }

    int subTotal() {
      double discount = totalProduct() * 0.3;
      return (totalProduct() - discount).ceil();
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
                          leading: Image(image: NetworkImage(item.imgUrl), height: 60),
                          title: Text(
                            item.productName,
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
                      title: Text('Tukarkan ${
                        user.coin >= subTotal()
                        ? formatRupiah(subTotal())
                        : formatRupiah(user.coin)
                      } koin', style: const TextStyle(fontWeight: FontWeight.w500)),
                      trailing: user.coin <= 0
                      ? const SizedBox()
                      : Switch(
                        key: const Key('coin-switch'),
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
                      isThreeLine: true,
                      title: Row(
                        children: [
                          Icon(Icons.receipt_long_outlined, color: CustomColors.primary),
                          const SizedBox(width: 10),
                          const Text('Rincian Pembayaran', style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Subtotal untuk produk'),
                                Text(formatRupiah(totalProduct()))
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Subtotal biaya pengiriman (gratis ongkir)'),
                                Text('Rp0')
                              ],
                            ),
                            const SizedBox(height: 5),
                            !isCoinEnabled
                            ? const SizedBox()
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Tukar Koin'),
                                Text(
                                  user.coin >= subTotal()
                                  ? formatRupiah(subTotal())
                                  : formatRupiah(user.coin)
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Diskon 30%'),
                                Text(formatRupiah((totalProduct() * 0.3).ceil()))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Pembayaran', style: TextStyle(color: Colors.black)),
                                Text(formatRupiah(countTotalPayment(totalProduct: subTotal(), shippingCost: 0)), style: const TextStyle(color: Color(0xFF264ECA)))
                              ],
                            )
                          ],
                        ),
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
            onPressed: () async {
              if (countTotalPayment(totalProduct: totalProduct(), shippingCost: 0) > user.balance + user.coin) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return popupMessageDialog(context, judul: 'Gagal', content: 'Saldo tidak cukup, silahkan lakukan top-up saldo Anda');
                  },
                );
              } else {
                final String result = await Provider.of<OrdersProvider>(context, listen: false).createOrder(
                  address: user.address.where((element) => element.status == true).first.address,
                  items: widget.cart,
                  isCoin: isCoinEnabled,
                  isCart: widget.isCart
                );
                if (result == 'success') {
                  if(!mounted) return;
                  Provider.of<NotificationProvider>(context, listen: false).getNotification();
                  Provider.of<CartProvider>(context, listen: false).getCart();
                  Provider.of<AuthProvider>(context, listen: false).getProfile();
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return popupMessageDialog(context, judul: 'Berhasil', content: 'Pembayaran telah berhasil, silahkan cek pesanan Anda.');
                    },
                  );
                  if(!mounted) return;
                  Navigator.popUntil(context, ModalRoute.withName('/dashboard'));
                } else {
                  if(!mounted) return;
                  snackBar(context, 'gagal, $result');
                }
              }
            },
          )
        ],
      ),
    );
  }
}