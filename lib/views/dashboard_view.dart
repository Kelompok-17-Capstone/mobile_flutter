import 'package:flutter/material.dart';
import 'package:mobile_flutter/views/dashboard/home_view.dart';
import 'package:mobile_flutter/views/dashboard/member_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/provider/notification_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:mobile_flutter/views/dashboard/products_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final pageConttroller = PageController();

  int currentIndex = 0;

  List<Widget> pageList = [
    const CircularProgressIndicator(),
    const ProductsView(),
    const MemberView()
  ];

  @override
  void initState() {
    pageList[0] = HomeView(pageController: pageConttroller);
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getNewProducts();
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
      Provider.of<CartProvider>(context, listen: false).getCart();
      Provider.of<NotificationProvider>(context, listen: false).getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageConttroller,
        onPageChanged: (index) => setState(() => currentIndex = index),
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        onTap: (value) {
          setState(() {
            pageConttroller.animateToPage(
              value, 
              duration: const Duration(milliseconds: 300), 
              curve: Curves.easeInOut
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.devices_outlined), label: 'Produk'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_membership_outlined), label: 'Member')
        ],
      ),
    );
  }
}
