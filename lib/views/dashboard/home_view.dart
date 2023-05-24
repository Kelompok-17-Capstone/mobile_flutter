import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
      
              // Header
              Stack(
                children: [
                  Container(
                    height: 253,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF2649CA), Colors.black]
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    hintText: 'Cari Produk',
                                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(6))),
                                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(6))),
                                  ),
                                )
                              ),
                              IconButton(
                                onPressed: () {
                                  
                                },
                                icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  
                                },
                                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text('Blue Alien Series Telah MENANTIMU!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14
                                      ),
                                    ),
                                    Text('Segera beli sekarang dan rasakan performa terbaik dengan tekonologi terbaru di ruang Anda',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Stack(
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(50, 10),
                                      child: const Image(
                                        image: AssetImage('assets/icons/alta_icon.png'),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(5, 70),
                                      child: const Image(
                                        image: AssetImage('assets/icons/alta_icon.png'),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(100, 70),
                                      child: const Image(
                                        image: AssetImage('assets/icons/alta_icon.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 430, // Absolute Position
                    top: -150,
                    child: Transform.rotate(
                      angle: 125, // Roate
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                        width: 415,
                        height: 190,
                        transform: Matrix4.rotationY(math.pi), // Flip
                      ),
                    ),
                  )
                ],
              ),
      
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
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(Icons.confirmation_number_outlined, color: Color(0xFF264ECA)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Voucher')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF264ECA)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Pesanan')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(Icons.monetization_on_outlined, color: Color(0xFF264ECA)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Koin')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(Icons.favorite_outline, color: Color(0xFF264ECA)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text('Favorit')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
      
              // Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Produk Terbaru',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                        ),
                        Text(
                          'lihat semua',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1/1.2
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.25,
                              color: Colors.white,
                              child: const Image(image: AssetImage('assets/icons/alta_icon.png')),
                            ),
                            const Expanded(
                              child: Text(
                                '#PRODUCT_NAME',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.devices_outlined), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership_outlined), label: 'Member')
        ],
      ),
    );
  }
}