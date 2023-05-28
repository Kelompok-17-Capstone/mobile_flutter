part of imports;

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
          '/personal_form':(context) => const PersonalFormView(),
          '/dashboard': (context) => const DashboardView(),
          '/user_setting': (context) => const SettingView(),
          '/setting_email': (context) => const SettingEmailView(),
          '/setting_password': (context) => const SettingPasswordView(),
          '/setting_name': (context) => const SettingNameView(),
          '/setting_phone': (context) => const SettingPhoneView(),
          '/setting_address': (context) => const SettingAddressView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detail_product') {
            final args = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) {
                return DetailProductView(index: args);
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
