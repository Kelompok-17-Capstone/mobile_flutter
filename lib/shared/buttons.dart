import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/product_model.dart';

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

Container miniButton({required IconData icon, required void Function()? onPressed}) {
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4)
    ),
    child: FittedBox(
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    ),
  );
}

Widget buyNowButton(BuildContext context, {required Widget leftContent, required String labelButton, required void Function()? onPressed}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: const Color(0xFF264ECA))
          ),
          child: leftContent
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF264ECA),
            border: Border.all(width: 0.5, color: const Color(0xFF264ECA))
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(labelButton, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        ),
      )
    ],
  );
}