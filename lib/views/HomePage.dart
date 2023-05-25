import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/views/login.dart';
import 'package:mobile_flutter/views/reusableWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 126, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  judulAtas(
                    inputText: 'Berhasil',
                  ),
                   SizedBox(
                              height: 8,
                            ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Resgitrasi Anda telah berhasil. Silahkan lakukan',
                                style: GoogleFonts.poppins(
                                  color: Color.fromRGBO(153, 153, 153, 1)
                                ),)
                              ],
                            ),
                  
                            Container(
                              padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                              child: Row(
                                children: [Text('masuk akun sekarang',
                                style: GoogleFonts.poppins(
                                  color: Color.fromRGBO(153, 153, 153, 1)
                                ),)],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  fullWidthButton(
                    label: 'Daftar Akun', 
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
