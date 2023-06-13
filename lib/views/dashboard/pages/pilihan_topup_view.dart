import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup_dana_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup_ovo_view.dart';

class PilihanTopupView extends StatefulWidget {
  const PilihanTopupView({super.key});

  @override
  State<PilihanTopupView> createState() => _PilihanTopupViewState();
}

class _PilihanTopupViewState extends State<PilihanTopupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Top Up', isBackButton: true, isElevated: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TopupDanaView()));
              },
              leading: const Image(image: AssetImage('assets/icons/Dana.png')),
              title: const Text('Top Up dengan Dana'),
              trailing: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF264ECA).withOpacity(0.1),
                  border: Border.all(
                    color: const Color(0xFF264ECA)
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: const Icon(
                  Icons.arrow_right_alt_outlined, 
                  color: Color(0xFF264ECA),
                  size: 15,
                )
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TopupOvoView()));
              },
              leading: const Image(image: AssetImage('assets/icons/OVO.png')),
              title: const Text('Top Up dengan OVO'),
              trailing: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF264ECA).withOpacity(0.1),
                  border: Border.all(
                    color: const Color(0xFF264ECA)
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: const Icon(
                  Icons.arrow_right_alt_outlined, 
                  color: Color(0xFF264ECA),
                  size: 15,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
