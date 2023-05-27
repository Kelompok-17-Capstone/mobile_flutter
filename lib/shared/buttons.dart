import 'package:flutter/material.dart';

ElevatedButton fullWidthButton({required String label, required void Function() onPressed}) {
  return ElevatedButton(
    key: Key('$label-key'),
    onPressed: onPressed,
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size.fromHeight(56)),
      backgroundColor: MaterialStateProperty.all(const Color(0xFF264ECA))
    ),
    child: Text(label),
  );
}

Column circleButton({required IconData icon, required String label, required void Function() onPressed}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: const Color(0xFF264ECA)),
        ),
      ),
      const SizedBox(height: 5),
      Text(label)
    ],
  );
}

IconButton customBackButton(BuildContext context) {
  return IconButton(
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
  );
}