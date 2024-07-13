import 'package:ceylontrailapp/screen/intro_screen_1.dart';
import 'package:ceylontrailapp/screen/intro_screen_2.dart';
import 'package:ceylontrailapp/screen/intro_screen_3.dart';
import 'package:ceylontrailapp/screen/welcome_screen.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/common_button_1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController =
      PageController(); // this keeps a track of which page u r on

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const WelcomeScreen());
                    },
                    child: CommonButton1(
                      text: 'Skip',
                      textColor: AppTheme.colors.white,
                      buttonColor: AppTheme.colors.black,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    // Assuming _pageController is your PageController
                    count: 3,
                    // Total number of pages
                    effect: WormEffect(
                      // Choose the effect you want, like WormEffect, SlideEffect, etc.
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: AppTheme.colors.secondary_light_3,
                      dotColor: AppTheme.colors.secondary_light_1,
                    ),
                  ),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Get.to(const WelcomeScreen());
                          },
                          child: CommonButton1(
                            text: 'Done',
                            textColor: AppTheme.colors.white,
                            buttonColor: AppTheme.colors.black,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: CommonButton1(
                            text: 'Next',
                            textColor: AppTheme.colors.white,
                            buttonColor: AppTheme.colors.black,
                          ),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
