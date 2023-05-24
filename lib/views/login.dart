import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/views/reusableWidget.dart';
import 'package:http/http.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  bool _isPasswordVisible = false;

  void register(String email, password) async {
    try {
      Response response = await post(Uri.parse('https://3.0.183.235/register'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonEncode(response.body.toString());
        print('Account Created');
      } else {
        print('Gagal e mbak');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                  logoKecil(),
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
                      obscureText: !_isPasswordVisible, // Set the obscureText property based on the state
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter',
                        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible; // Toggle the state
                            });
                          },
                          child: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
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
                      controller: passwordConfirmation,
                      obscureText: !_isPasswordVisible, 
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter',
                        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible; 
                            });
                          },
                          child: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
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
                        register(emailController.text.toString(),
                            passwordController.text.toString());
                      },
                      child: Text(
                        'Masuk Akun',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
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
