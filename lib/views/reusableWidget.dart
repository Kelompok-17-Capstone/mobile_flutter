import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class logoKecil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 20,
            width: 24,
            child: Image.asset('assets/images/icon.png'),
          ),
          Container(
            width: 54,
            height: 18,
            child: Image.asset('assets/images/AltaTech.png'),
          ),
        ],
      ),
    );
  }
}

class judulAtas extends StatelessWidget {
  final String inputText;

  const judulAtas({required this.inputText});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 360,
          // height: 48,
          padding: EdgeInsets.fromLTRB(40, 0, 52, 0),
            child:
            Text(
                    inputText,
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(38, 78, 202, 1)),
                  ),
                ),
      ],
    );
    
  }
}
