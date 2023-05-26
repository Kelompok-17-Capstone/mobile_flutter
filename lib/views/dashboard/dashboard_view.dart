import 'package:flutter/material.dart';
import 'package:mobile_flutter/views/dashboard/home_view.dart';
import 'package:mobile_flutter/views/dashboard/member_view.dart';
import 'package:mobile_flutter/views/dashboard/produk_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  List<Widget> pageList = [
    const HomePageView(),
    const Produk(),
    const MemberView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        onTap: (value) {
          setState(() {
            currentIndex = value;
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
