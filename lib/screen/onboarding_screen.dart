import 'package:ceylontrailapp/screen/intro_screen_1.dart';
import 'package:ceylontrailapp/screen/intro_screen_2.dart';
import 'package:ceylontrailapp/screen/intro_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../theme/app_theme.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(); // this keeps a track of which page u r on

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0,0.8),
              child: SmoothPageIndicator(controller: _pageController, count: 3)
          )

        ],
      ),
    );
  }
}

