import 'package:flutter/material.dart';
import 'package:mobile_flutter/views/auth/login_view.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/auth/register_view.dart';
import 'package:mobile_flutter/views/dashboard/dashboard_view.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_address_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_email_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_name_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_password_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_phone_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_view.dart';
import 'package:mobile_flutter/views/dashboard/welcome_view.dart';
import 'package:mobile_flutter/views/splash_screen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => AuthProvider()),
        ChangeNotifierProvider(create:(context) => ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/welcome': (context) => const WelcomeView(),
          '/register': (context) => const RegisterView(),
          '/login': (context) => const LoginView(),
          '/dashboard': (context) => const DashboardView(),
          '/user_setting': (context) => const SettingView(),
          '/setting_email': (context) => const SettingEmailView(),
          '/setting_password': (context) => const SettingPasswordView(),
          '/setting_name': (context) => const SettingNameView(),
          '/setting_phone': (context) => const SettingPhoneView(),
          '/setting_address': (context) => const SettingAddressView(),
        },
      ),
    );
  }
}
