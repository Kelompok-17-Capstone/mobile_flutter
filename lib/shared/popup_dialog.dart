import 'package:flutter/material.dart';

Dialog popupMessageDialog(BuildContext context ,{required String judul, required String content}) {

  return Dialog(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            judul,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey[500],
                fontSize: 16,
              )
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFF264ECA))
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )
            ),
          ),
        ],
      ),
    ),
  );
}