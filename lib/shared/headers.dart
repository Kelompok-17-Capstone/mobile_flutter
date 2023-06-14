import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'dart:math' as math;

import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

Widget customHeaderWithIcon({required String title}) {
  return Column(
    children: [
      const Image(
        image: AssetImage('assets/icons/alta_icon.png'),
        width: 19,
      ),
      const Text(
        'AltaTech',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12
        ),
      ),
      const SizedBox(height: 16),
      Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )
      ),
    ],
  );
}

Widget homeHeader(BuildContext context) {
  final UserModel? user = Provider.of<AuthProvider>(context).user;
  return Stack(
    children: [
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
          ),
          Positioned(
            left: 470, // Absolute Position
            top: -150,
            child: Transform.rotate(
              angle: 125, // Roate
              child: Container(
                color: Colors.white.withOpacity(0.2),
                width: 415,
                height: 210,
                transform: Matrix4.rotationY(math.pi), // Flip
              ),
            ),
          )
        ],
      ),
      Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Cari Produk',
                        contentPadding: EdgeInsets.zero,
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
                      if (user == null) {
                        snackBar(context, 'Login untuk melihat keranjang');
                      } else {
                        Navigator.pushNamed(context, '/cart');
                      }
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
                        Text('BLUE ALIEN SERIES TELAH MENANTIMU!',
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
                            fontSize: 10
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
    ],
  );
}

Container profileHeader(BuildContext context, {String? name, String? imgUrl, void Function()? onTap}) {
  return Container(
    height: 252,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF2649CA), Colors.black]
      )
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              backgroundColor: Colors.white.withOpacity(0.2),
              backgroundImage: imgUrl == null || imgUrl.isEmpty ? null : NetworkImage(imgUrl),
              child: imgUrl == null || imgUrl.isEmpty
              ? Text(name != null ? name[0] : 'G', style: const TextStyle(fontSize: 48))
              : const SizedBox()
            ),
          ),
          const SizedBox(height: 15),
          Text(
            name ?? 'Guest',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          )
        ],
      ),
    ),
  );
}