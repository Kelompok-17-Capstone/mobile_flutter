import 'package:flutter/material.dart';
import 'dart:math' as math;

Stack homeHeader(BuildContext context) {
  return Stack(
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
  );
}

Container profileHeader(BuildContext context) {
  return Container(
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
  );
}