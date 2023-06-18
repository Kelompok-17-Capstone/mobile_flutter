import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/shared/product_search_delegate.dart';
import 'dart:math' as math;
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/notification_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_provider.dart';
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
  final int notificationCount = Provider.of<NotificationProvider>(context).notifications.where((element) => element.isRead == false).length;
  final int cartCount = Provider.of<CartProvider>(context).items.length;
  TextEditingController searchController = TextEditingController();

  bool globalCooldown = false;

  Future<void> searchProduct({required BuildContext context, required SearchDelegate<void> delegate}) async {
    if (globalCooldown) {
      return;
    }

    globalCooldown = true;
    await Future.delayed(const Duration(seconds: 2), () async {
      await showSearch(
        query: searchController.text,
        context: context,
        delegate: delegate
      );
      if (context.mounted) {
        FocusScope.of(context).requestFocus(FocusNode());
        searchController.text = '';
      }
      globalCooldown = false;
    });
  }

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
                      controller: searchController,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) async {
                        await searchProduct(context: context, delegate: ProductSearchDelegate());
                      },
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
                  GestureDetector(
                    onTap: () {
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
                        Navigator.pushNamed(context, '/notification');
                      }
                    },
                    child: Stack(
                      children: [
                        IconButton(
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
                              Navigator.pushNamed(context, '/notification');
                            }
                          },
                          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                        ),
                        notificationCount == 0
                        ? const SizedBox()
                        : Positioned(
                          right: 11,
                          top: 11,
                          child:  Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              notificationCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
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
                        Navigator.pushNamed(context, '/cart');
                      }
                    },
                    child: Stack(
                      children: [
                        IconButton(
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
                              Navigator.pushNamed(context, '/cart');
                            }
                          },
                          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        ),
                        cartCount == 0
                        ? const SizedBox()
                        : Positioned(
                          right: 11,
                          top: 11,
                          child:  Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              cartCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          offset: const Offset(50, -30),
                          child: const Image(
                            image: AssetImage('assets/images/products/monitor.png'),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(30, 70),
                          child: const Image(
                            image: AssetImage('assets/images/products/mouse.png'),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(140, 70),
                          child: const Image(
                            image: AssetImage('assets/images/products/headset.png'),
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

Widget customHeader(BuildContext context, {required String title, required Widget content}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.29,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 130,
          width: double.infinity,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 37, 73, 204),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: content
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            leading: customBackButton(context, color: Colors.white),
            title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          )
        ),
      ],
    ),
  );
}