import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';

class TopupOVO extends StatefulWidget {
  const TopupOVO({super.key});

  @override
  State<TopupOVO> createState() => _TopupOVOState();
}

class _TopupOVOState extends State<TopupOVO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Top Up OVO', isBackButton: true, isElevated: true),
    );
  }
}
