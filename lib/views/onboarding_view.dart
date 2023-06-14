import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with TickerProviderStateMixin {

  final PageController pageViewController = PageController();
  int currentIndex = 0;

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
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: (value) {
              print(value);
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
            },
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Page 1'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Page 2'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Page 3'),
                ],
              )
            ],
          ),
          Positioned.fill(
            top: 200,
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
          )
        ]
      ),
    );
  }
}