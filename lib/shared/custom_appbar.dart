import 'package:flutter/material.dart';

AppBar customAppBar({ required String title, bool isBackButton = false }) {
  return AppBar(
    title: Text(title),
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.3
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
  );
}