import 'package:flutter/material.dart';

TextFormField emailForm({required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'customer.id@altatech.com',
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6)),
    ),
  );
}

TextFormField passwordForm({required TextEditingController controller, required bool isPasswordVisible, required Widget icon, required void Function()? onPressed}) {

  return TextFormField(
    controller: controller,
    obscureText: isPasswordVisible,
    decoration: InputDecoration(
      hintText: 'minimal 8 Karakter',
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: icon
      )
    ),
  );
}