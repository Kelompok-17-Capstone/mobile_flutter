import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/views/HomePage.dart';
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
  bool isIconVisible = false;
  bool _passwordsNotMatch = false;

  void register(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        if (passwordConfirmation.text == password) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print('Error: Passwords do not match');
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NotificationError(content: 'Alamat Email anda tidak ditemukan!', judul: 'Data Tidak Valid');
          },
        );
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
                    inputText: 'Pendaftaran Akun',
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
                      obscureText: !_isPasswordVisible,
                      onChanged: (value) {
                        setState(() {
                          _passwordsNotMatch =
                              value != passwordConfirmation.text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter',
                        hintStyle:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                              isIconVisible = !isIconVisible;
                            });
                          },
                          child: Image.asset(
                            isIconVisible
                                ? 'assets/images/bukaMata.png'
                                : 'assets/images/mataIcon.png',
                            width: 24,
                            height: 24,
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
                      onChanged: (value) {
                        setState(() {
                          _passwordsNotMatch =
                              value != passwordConfirmation.text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter',
                        hintStyle:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                              isIconVisible = !isIconVisible;
                            });
                          },
                          child: Image.asset(
                            isIconVisible
                                ? 'assets/images/bukaMata.png'
                                : 'assets/images/mataIcon.png',
                            width: 24,
                            height: 24,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  fullWidthButton(
                    label: 'Masuk Akun', onPressed: () {
                        String email = emailController.text;
                        String password = passwordController.text;
                        setState(() {
                          _passwordsNotMatch = passwordConfirmation.text !=
                              passwordController.text;
                        });
                        if (_passwordsNotMatch) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return NotificationError(
                                  content: 'Kata sandi Tidak sama!',
                                  judul: 'Data Tidak Valid');
                            },
                          );
                        }
                        if (!email.contains('@')) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return NotificationError(
                                  content:
                                      'Alamat email Anda tidak valid karena tanpa menggunakan karakter ‘@’',
                                  judul: 'Data Tidak Valid');
                            },
                          );
                        }
                        if (password.length < 8) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return NotificationError(
                                  content:
                                      'Kata sandi Anda tidak valid karena kurang dari 8 karakter',
                                  judul: 'Data Tidak Valid');
                            },
                          );
                        } 
                        else {
                          register(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                          );
                        }
                      },),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
