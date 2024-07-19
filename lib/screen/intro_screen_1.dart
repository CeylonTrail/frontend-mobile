import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/intro_page_1.png', fit: BoxFit.fill),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Plan Your Trip",
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.black87,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              textAlign: TextAlign.center,
              "Explore Sri Lanka like never before with personalized trip planning and local insights with CeylonTrail.",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black38,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
