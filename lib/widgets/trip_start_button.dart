import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Create a new stateless widget class
class TripStartButton extends StatelessWidget {
  // Def ine a constructor to potentially accept on click functionality
  const TripStartButton({super.key, this.onPressed});

  // Define an optional onPressed callback function
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Return a TextButton with rounded corners
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppTheme.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: SizedBox(
        width: 80,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Start',
              style: TextStyle(
                  color: AppTheme.colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600// Set the font size to 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
