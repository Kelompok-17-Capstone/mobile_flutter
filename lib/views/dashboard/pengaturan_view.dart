import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/customAppBar.dart';

class PengaturanView extends StatelessWidget {
  const PengaturanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Pengaturan'),
    );
  }
}
