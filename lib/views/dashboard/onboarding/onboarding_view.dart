import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/views/dashboard/onboarding/intro_daftar_view.dart';
import 'package:mobile_flutter/views/dashboard/onboarding/intro_informasi_view.dart';
import 'package:mobile_flutter/views/dashboard/onboarding/intro_produk_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with TickerProviderStateMixin {

  final PageController pageViewController = PageController();
  int currentIndex = 0;

  final List<Widget> pages = [
    const IntroDaftarView(),
    const IntroInformasiView(),
    const IntroProdukView()
  ];

  late AnimationController firstIndicator;
  late AnimationController secondIndicator;
  late AnimationController thirdIndicator;

  late Animation firstColorTween;
  late Animation secondColorTween;
  late Animation thirdColorTween;

  @override
  void initState() {
    firstIndicator = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    secondIndicator = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    thirdIndicator = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    
    firstColorTween = ColorTween(begin: Colors.grey, end: const Color(0xFF264ECA)).animate(firstIndicator);
    secondColorTween = ColorTween(begin: Colors.grey, end: const Color(0xFF264ECA)).animate(secondIndicator);
    thirdColorTween = ColorTween(begin: Colors.grey, end: const Color(0xFF264ECA)).animate(thirdIndicator);

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      firstIndicator.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          currentIndex == 2
          ? const SizedBox()
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: const Text(
                'Lewati',
                style: TextStyle(fontSize: 12, color: Color(0xFF264ECA))
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: (value) {
              if (value == 0) {
                firstIndicator.forward();
                secondIndicator.reverse();
                thirdIndicator.reverse();
              }
              if (value == 1) {
                firstIndicator.reverse();
                secondIndicator.forward();
                thirdIndicator.reverse();
              }
              if (value == 2) {
                firstIndicator.reverse();
                secondIndicator.reverse();
                thirdIndicator.forward();
              }
              setState(() {
                currentIndex = value;
              });
            },
            children: pages
          ),
          Positioned.fill(
            top: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: firstColorTween,
                  builder: (context, child) {
                    return Icon(Icons.minimize_outlined, color: firstColorTween.value);
                  },
                ),
                AnimatedBuilder(
                  animation: secondColorTween,
                  builder: (context, child) {
                    return Icon(Icons.minimize_outlined, color: secondColorTween.value);
                  },
                ),
                AnimatedBuilder(
                  animation: thirdColorTween,
                  builder: (context, child) {
                    return Icon(Icons.minimize_outlined, color: thirdColorTween.value);
                  },
                ),
              ],
            ),
          ),
          currentIndex == 0
          ? const SizedBox()
          : Positioned(
            left: 20,
            bottom: 20,
            child: IconButton(
              key: const Key('back-button-key'),
              onPressed: () {
                pageViewController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
              },
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF264ECA)
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: const FittedBox(
                  child: Icon(
                    Icons.navigate_before_outlined,
                    color: Color(0xFF264ECA),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: currentIndex == 2
            ? TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Finish', style: TextStyle(color: Color(0xFF264ECA)))
            )
            : IconButton(
              key: const Key('forward-button-key'),
              onPressed: () {
                pageViewController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
              },
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF264ECA),
                  border: Border.all(
                    color: const Color(0xFF264ECA)
                  ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: const FittedBox(
                  child: Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}