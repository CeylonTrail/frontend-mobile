import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/intro_page_3.png', fit: BoxFit.fill),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Start the Journey",
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.black87,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Begin your adventure with us. Plan your trip, discover new places, and create lasting memories with ease.",
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
