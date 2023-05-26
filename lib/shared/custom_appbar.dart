import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, { required String title, bool isBackButton = false, bool isElevated = true }) {
  return AppBar(
    leading: !isBackButton
    ? const SizedBox()
    : IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF264ECA)
          ),
          borderRadius: BorderRadius.circular(100)
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Color(0xFF264ECA),
          size: 13,
        ),
      ),
    ),
    title: Text(title),
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.3
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: isElevated ? 2 : 0,
  );
}