import 'package:flutter/material.dart';

Dialog popupMessageDialog(BuildContext context ,{required String content, required String judul}) {
  final screenSize = MediaQuery.of(context).size;
  final boxWidth = screenSize.width * 0.8;
  final boxHeight = screenSize.height * 0.270;

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
              color: Color.fromRGBO(238, 46, 46, 1),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 14,
              )
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(38, 78, 202, 1),
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              minimumSize: Size(190, 37),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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