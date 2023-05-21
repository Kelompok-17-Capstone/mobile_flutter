import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                  Container(
                    height: 29,
                    width: 24,
                    child: Image.asset('assets/images/icon.png'),
                  ),
                  Container(
                    width: 54,
                    height: 18,
                    child: Image.asset('assets/images/AltaTech.png'),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    child: Text('Create an Account!',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(38, 78, 202, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 56,
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
                  Container(
                    child: TextFormField(
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'customer.id@altatech.com',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                  //PASSWORD
                  Container(
                    child: TextFormField(
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'minimal 8 Karakter' ,
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                   Container(
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(38, 78, 202, 1),
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                       
                        minimumSize: Size(380, 56), //////// HERE
                      ),
                      onPressed: () {},
                      child: Text('Daftar Akun'),
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
                // Container(
                //     child: Image.asset(
                //   'assets/images/login.png',
                //   height: 350,
                //   fit: BoxFit.fitWidth,
                // )),
                // //EMAIL
                // TextFormField(
                //   controller: authController.emailController,
                //   decoration: InputDecoration(
                //     hintText: 'Email',
                //     prefixIcon: Icon(Icons.email_rounded),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // //PASSWORD
                // TextFormField(
                //   controller: authController.passwordController,
                //   decoration: InputDecoration(
                //     hintText: 'Password',
                //     prefixIcon: Icon(Icons.password_sharp),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //   ),
                //   obscureText: true,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   width: 250,
                //   height: 45,
                //   child: TextButton(
                //     style: TextButton.styleFrom(
                //       backgroundColor: Colors.green,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //     onPressed: () async {
                //       authController.signIn();
                //     },
                //     child: Text(
                //       "Login",
                //       style: TextStyle(
                //         color: Color(0xffffffff),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   child: Center(
                //     child: Row(
                //       children: [
                //         const Text(
                //           "Don't have an account? ",
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => SignUpScreen()));
                //           },
                //           child: const Text(
                //             'Sign Up',
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
