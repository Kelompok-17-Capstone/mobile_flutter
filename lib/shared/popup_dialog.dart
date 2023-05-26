import 'package:flutter/material.dart';

Dialog popupMessageDialog(BuildContext context ,{required String content, required String judul}) {
  final screenSize = MediaQuery.of(context).size;
  final boxWidth = screenSize.width * 0.8;
  final boxHeight = screenSize.height * 0.3;

  return Dialog(
    child: Container(
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            judul,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.redAccent,
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
                fontSize: 14,
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