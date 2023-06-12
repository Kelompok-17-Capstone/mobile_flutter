import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup_dana.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup_ovo.dart';

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
        padding: const EdgeInsets.fromLTRB(24,19,0,0),
        child: Column(
          children: <Widget> [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TopupDana()));
              },
              child: Row(
                children: [
                  Image.asset('assets/icons/Dana.png'),
                  SizedBox(
                    width: 12,
                  ),
                  const Text('Top Up dengan Dana',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                    SizedBox(width: 122,),
                  Image.asset('assets/icons/next.png')
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TopupOVO()));
              },
              child: Row(
                children: [
                  Image.asset('assets/icons/OVO.png'),
                  SizedBox(
                    width: 12,
                  ),
                  const Text('Top Up dengan OVO',
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                    SizedBox(width: 130,),
                  Image.asset('assets/icons/next.png')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
