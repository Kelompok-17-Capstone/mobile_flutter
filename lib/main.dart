import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_flutter/arguments/checkout_view_argument.dart';
import 'package:mobile_flutter/arguments/detail_product_view_argument.dart';
import 'package:mobile_flutter/arguments/setting_address_form_view_argument.dart';
import 'package:mobile_flutter/views/auth/login_view.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:mobile_flutter/views/auth/personal_form_view.dart';
import 'package:mobile_flutter/views/auth/register_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/list_pesanan_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup/topup_dana_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup/topup_ovo_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup/topup_success_view.dart';
import 'package:mobile_flutter/views/dashboard/pages/topup/topup_view.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_address_form_view.dart';
import 'package:mobile_flutter/views/dashboard_view.dart';
import 'package:mobile_flutter/views/dashboard/product/cart_provider.dart';
import 'package:mobile_flutter/views/dashboard/product/checkout_view.dart';
import 'package:mobile_flutter/views/dashboard/product/detail_product_view.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_address_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_email_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_name_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_password_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_phone_view.dart';
import 'package:mobile_flutter/views/dashboard/user_setting/setting_view.dart';
import 'package:mobile_flutter/views/dashboard/onboarding/onboarding_view.dart';
import 'package:mobile_flutter/views/welcome_view.dart';
import 'package:mobile_flutter/views/splash_screen_view.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => AuthProvider()),
        ChangeNotifierProvider(create:(context) => ProductProvider()),
        ChangeNotifierProvider(create:(context) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/welcome': (context) => const WelcomeView(),
          '/register': (context) => const RegisterView(),
          '/login': (context) => const LoginView(),
          '/personal_form':(context) => const PersonalFormView(),
          '/onboarding': (context) => const OnboardingView(),
          '/dashboard': (context) => const DashboardView(), // Dashboard / Homepage
          '/topup': (context) => const TopupView(),
          '/topup_dana': (context) => const TopupDanaView(),
          '/topup_ovo': (context) => const TopupOvoView(),
          '/topup_success': (context) => const TopupSuccessView(),
          '/cart': (context) => const CartView(),
          '/list_pesanan': (context) => const ListPesananView(),
          '/user_setting': (context) => const SettingView(),
          '/setting_email': (context) => const SettingEmailView(),
          '/setting_password': (context) => const SettingPasswordView(),
          '/setting_name': (context) => const SettingNameView(),
          '/setting_phone': (context) => const SettingPhoneView(),
          '/setting_address': (context) => const SettingAddressView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detail_product') {
            final args = settings.arguments as DetailProductViewArgument;
            return MaterialPageRoute(
              builder: (context) {
                return DetailProductView(index: args.index);
              },
            );
          }

          if (settings.name == '/checkout') {
            final args = settings.arguments as CheckoutViewArgument;
            return MaterialPageRoute(
              builder: (context) {
                return CheckoutView(cart: args.cart);
              },
            );
          }

          if (settings.name == '/setting_address_form') {
            final args = settings.arguments as SettingAddressFormViewArgument;
            return MaterialPageRoute(
              builder: (context) {
                return SettingAddressFormView(isEditAddress: args.isEditAddress, address: args.address);
              }
            );
          }
          return null;
        },
      ),
    );
  }
}
