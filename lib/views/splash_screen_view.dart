import 'package:flutter/material.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      // Navigator.pushReplacementNamed(context, '/onboarding');
      final String result = await Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
      if (result == 'validated') {
        if(!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
      } else if (result == 'unvalidated') {
        if(!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/personal_form', (route) => false);
      } else {
        if(!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/icons/alta_icon.png'), width: 58),
            Text(
              'AltaTech',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}