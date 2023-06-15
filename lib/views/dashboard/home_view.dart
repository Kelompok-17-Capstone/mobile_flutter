import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/format_rupiah.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/shared/products_grid.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final PageController pageController;
  const HomeView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<AuthProvider>(context).user;
    final List<ProductModel> products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              homeHeader(context),

              // Card Saldo & Top Up
              Transform.translate(
                offset: const Offset(0, -35),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              tapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              fixedSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * 0.3, 40))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFF264ECA)),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    user == null ? 'Login untuk melihat saldo' : formatRupiah(user.balance),
                                    style: const TextStyle(color: Colors.black)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(color: Color(0xFF264ECA)),
                          ElevatedButton(
                            onPressed: () {
                              if (user == null) {
                                showDialog(
                                  context: context,
                                  builder:(context) => popupMessageDialog(
                                    context,
                                    judul: 'Maaf',
                                    content: ' Akun Anda belum terdaftar. Silahkan daftar akun untuk menikmati fitur ini.'
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(context, '/topup');
                              }
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              fixedSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * 0.3, 40))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_box_outlined, color: Color(0xFF264ECA)),
                                SizedBox(width: 5),
                                Text('Top Up', style: TextStyle(color: Colors.black)
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Horizontal Button
              Transform.translate(
                offset: const Offset(0, -10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      circleButton(
                        icon: Icons.confirmation_number_outlined,
                        label: 'Voucher',
                        onPressed: () {}
                      ),
                      circleButton(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Pesanan',
                        onPressed: () {}
                      ),
                      circleButton(
                        icon: Icons.monetization_on_outlined,
                        label: 'Koin',
                        onPressed: () {}
                      ),
                      circleButton(
                        icon: Icons.favorite_outline,
                        label: 'Favorit',
                        onPressed: () {}
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Produk Terbaru',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                          },
                          child: const Text(
                            'lihat semua',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.grey
                            ),
                          )
                        ),
                      ],
                    ),
                    productsGrid(products: products)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
