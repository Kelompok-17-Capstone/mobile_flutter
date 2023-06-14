import 'package:flutter/material.dart';

Widget altaTechLogo() {
  return Column(
    children: const [
      Image(
        image: AssetImage('assets/icons/alta_icon.png'),
        width: 19,
      ),
      Text(
        'AltaTech',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    ],
  );
}