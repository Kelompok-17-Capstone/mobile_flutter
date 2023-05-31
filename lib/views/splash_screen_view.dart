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
      final bool result = await Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
      if (result) {
        if(!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
      } else {
        if(!mounted) return;
        Navigator.pushReplacementNamed(context, '/welcome');
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