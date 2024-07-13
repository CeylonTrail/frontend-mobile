import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/intro_page_2.png', fit: BoxFit.fill),
          const SizedBox(height: 20,),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text(
              textAlign: TextAlign.center,
              "Gather Friends",
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
              "Experience this beautiful destination with personalized trip planning and local insights for an unforgettable adventure.",
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
