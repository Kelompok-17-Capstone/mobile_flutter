import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class CetakMemberView extends StatelessWidget {
  const CetakMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsToImageController imageController = WidgetsToImageController();
    final UserModel user = Provider.of<AuthProvider>(context, listen: false).user!;

    return Scaffold(
      appBar: customAppBar(context, title: 'Cetak Member', isBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetsToImage(
              controller: imageController,
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 42,
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100), topRight: Radius.circular(100)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFF2649CA),
                                  Colors.black,
                                ],
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Kartu Member ${user.name}',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: const [
                            Image(
                              height: 24,
                              image: AssetImage('assets/icons/alta_icon.png'),
                            ),
                            Text('Alta Tech', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
                          ],
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: BarcodeWidget(data: user.memberCode, barcode: Barcode.code128(), height: 100),
                    )
                  ],
                )
              ),
            ),
            const SizedBox(height: 20),
            fullWidthButton(label: 'Simpan Kartu', onPressed: () async {
              final bytes = await imageController.capture();
              if(context.mounted) {
                await Provider.of<AuthProvider>(context, listen: false).saveMemberCard(bytes: bytes!);
              }
            })
          ],
        ),
      ),
    );
  }
}