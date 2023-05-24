import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/views/reusableWidget.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
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
                  logoKecil(
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  judulAtas(
                    inputText: 'Create an Account!',
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Alamat Email',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'customer.id@altatech.com',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Kata Sandi',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //PASSWORD
                  Container(
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter',
                        hintStyle:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Konfirmasi Kata Sandi',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'minimal 8 karakter',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(38, 78, 202, 1),
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        minimumSize: Size(380, 56),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NotificationEmail(
                              content: 'Alamat email Anda tidak valid karena tanpa menggunakan karakter ‘@’',
                            );
                          },
                        );
                      },
                      child: Text(
                        'Masuk Akun',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
