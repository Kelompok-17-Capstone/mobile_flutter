import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/form.dart';
import 'package:mobile_flutter/shared/popup_dialog.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
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
              const Image(
                image: AssetImage('assets/icons/alta_icon.png'),
                width: 19,
              ),
              const Text(
                'AltaTech',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pendaftaran Akun',
                style: TextStyle(
                  fontSize: 28,
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
                    const SizedBox(height: 10),
                    formLabel(label: 'Kata Sandi'),
                    const SizedBox(height: 5),
                    //PASSWORD
                    passwordForm(
                      controller: passwordController, 
                      isPasswordVisible: isPasswordVisible,
                      // icon: isPasswordVisible ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    formLabel(label: 'Konfirmasi Kata Sandi'),
                    const SizedBox(height: 5),
                    passwordForm(
                      controller: confirmationPasswordController, 
                      isPasswordVisible: isPasswordVisible,
                      // icon: isPasswordVisible ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 25),

                    fullWidthButton(label: 'Daftar Akun', onPressed: () async {

                      if (formKey.currentState!.validate()) {

                        if (passwordController.text != confirmationPasswordController.text) {
                          showDialog(context: context, builder:(context) {
                            return popupMessageDialog(context, judul: 'Form Tidak Valid', content: 'Pastikan password dan confirmation password sama');
                          });
                        } else {
                          String result = await Provider.of<AuthProvider>(context, listen: false).register(
                            email: emailController.text.trim(), 
                            password: passwordController.text, 
                            confirmationPassword: confirmationPasswordController.text
                          );
                          if (result == 'register success') {
                            if(!mounted) return;
                            Navigator.pushReplacementNamed(context, '/personal_form');
                          }
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
