import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class TopupView extends StatefulWidget {
  const TopupView({super.key});

  @override
  State<TopupView> createState() => _TopupViewState();
}

class _TopupViewState extends State<TopupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: 'Top Up', isBackButton: true, isElevated: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/topup_dana');
              },
              leading: const Image(image: AssetImage('assets/icons/Dana.png')),
              title: const Text('Top Up dengan Dana'),
              trailing: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF264ECA).withOpacity(0.1),
                      border: Border.all(color: const Color(0xFF264ECA)),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Image(
                    image: AssetImage('assets/icons/ArrowCircleRight.png'),
                    color: Color(0xFF264ECA),
                    width: 15,
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/topup_ovo');
              },
              leading: const Image(image: AssetImage('assets/icons/OVO.png')),
              title: const Text('Top Up dengan OVO'),
              trailing: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF264ECA).withOpacity(0.1),
                      border: Border.all(color: const Color(0xFF264ECA)),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Image(
                    image: AssetImage('assets/icons/ArrowCircleRight.png'),
                    color: Color(0xFF264ECA),
                    width: 15,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
