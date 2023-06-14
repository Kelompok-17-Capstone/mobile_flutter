import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/logo.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Center(
          child: Column(
            children: [
              altaTechLogo(),
              const SizedBox(height: 16),
              const Text(
                'Kembali Bergabung',
                style: TextStyle(
                  fontSize: 32,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formLabel(label: 'Alamat Email'),
                    const SizedBox(height: 5),
                    emailForm(controller: emailController),
                    const SizedBox(height: 20),
                    formLabel(label: 'Kata Sandi'),
                    const SizedBox(height: 5),
                    //PASSWORD
                    passwordForm(
                      controller: passwordController,
                      isPasswordVisible: isPasswordVisible,
                      // icon: !isPasswordVisible ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 45),

                    fullWidthButton(label: 'Masuk Akun', onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        String result = await Provider.of<AuthProvider>(context, listen: false).login(
                          email: emailController.text.trim(), 
                          password: passwordController.text
                        );
                        if (result == 'login success') {
                          if(!mounted) return;
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        } else if(result == 'user unvalidated') {
                          if(!mounted) return;
                          Navigator.pushReplacementNamed(context, '/personal_form');
                        } 
                        else {
                          if(!mounted) return;
                          showDialog(context: context, builder:(context) {
                            return popupMessageDialog(context, judul: 'Login Gagal', content: 'Pastikan email dan password sudah benar');
                          });
                        }
                      }
                    })
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
