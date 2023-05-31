import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/shared/products_grid.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = Provider.of<ProductProvider>(context).products;
    print(products);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
      
              // Header
              homeHeader(context),
      
              // Card Saldo & Top Up
              Transform.translate(
                offset: const Offset(0, -30),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.account_balance_wallet_outlined, color: Color(0xFF264ECA)),
                                SizedBox(width: 5),
                                Text('Rp. 0', style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                          const VerticalDivider(color: Color(0xFF264ECA)),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.add_box_outlined, color: Color(0xFF264ECA)),
                                SizedBox(width: 5),
                                Text('Top Up', style: TextStyle(color: Colors.black)),
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
                      circleButton(icon: Icons.confirmation_number_outlined, label: 'Voucher', onPressed: () {
                        
                      }),
                      circleButton(icon: Icons.shopping_bag_outlined, label: 'Pesanan', onPressed: () {
                        
                      }),
                      circleButton(icon: Icons.monetization_on_outlined, label: 'Koin', onPressed: () {
                        
                      }),
                      circleButton(icon: Icons.favorite_outline, label: 'Favorit', onPressed: () {
                        
                      }),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            
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