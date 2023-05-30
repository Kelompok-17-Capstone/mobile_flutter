import 'package:flutter/material.dart';

import 'package:mobile_flutter/views/dashboard/dashboard_view.dart';
import 'package:mobile_flutter/views/dashboard/member_view.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:mobile_flutter/views/dashboard/produk_view.dart';
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
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/welcome': (context) => const WelcomeView(),
          '/dashboard': (context) => const DashboardView(),
        },
      ),
    );
  }
}
