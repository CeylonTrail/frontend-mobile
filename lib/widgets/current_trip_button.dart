import 'package:ceylontrailapp/screen/current_trip_screen.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// Create a new stateless widget class
class CurrentTripButton extends StatelessWidget {
  // Define a constructor to potentially accept on click functionality
  const CurrentTripButton({super.key, this.onPressed});

  // Define an optional onPressed callback function
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Return a TextButton with rounded corners
    return GestureDetector(
      onTap: (){
        Get.to(const CurrentTripScreen());
      },
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppTheme.colors.primary_dark_3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: SizedBox(
          width: 140,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/bx-trip.svg',
              ),
              const SizedBox(width: 7),
              Text(
                'Current Trip',
                style: TextStyle(
                    color: AppTheme.colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600// Set the font size to 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
