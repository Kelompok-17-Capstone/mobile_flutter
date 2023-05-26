import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter/shared/form_validator.dart';

TextFormField customForm({required TextEditingController controller, required String hintText, bool enabled = true, bool isNumberOnly = false, int maxLines = 1}) {
  return TextFormField(
    controller: controller,
    enabled: enabled,
    inputFormatters: isNumberOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
    maxLines: maxLines,
    validator: (value) => FormValidator.validateName(name: value),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6)),
    ),
  );
}

TextFormField emailForm({required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    validator: (value) => FormValidator.validateEmail(email: value),
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

TextFormField passwordForm({required TextEditingController controller, required bool isPasswordVisible, required void Function()? onPressed}) {

  return TextFormField(
    controller: controller,
    validator: (value) => FormValidator.validatePassword(password: value),
    obscureText: !isPasswordVisible,
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
        icon: isPasswordVisible ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined)
      )
    ),
  );
}