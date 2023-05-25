import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/icons/alta_icon.png'),
                width: 19,
              ),
              const Text(
                'AltaTech',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(height: 16),
              const Text('Pendaftaran Akun',
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alamat Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    emailForm(controller: emailController),
                    const SizedBox(height: 10),
                    const Text(
                      'Kata Sandi',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    //PASSWORD
                    passwordForm(
                      controller: passwordController,
                      isPasswordVisible: isPasswordVisible,
                      icon: !isPasswordVisible
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 25),

                    fullWidthButton(
                      label: 'Daftar Akun',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
