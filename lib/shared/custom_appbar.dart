import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';

AppBar customAppBar(BuildContext context, { required String title, bool isBackButton = false, bool isElevated = true, List<Widget>? actions }) {
  return AppBar(
    leading: !isBackButton
    ? const SizedBox()
    : customBackButton(context),
    title: Text(title),
    actions: actions,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black.withOpacity(0.9),
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.3
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: isElevated ? 2 : 0,
  );
}