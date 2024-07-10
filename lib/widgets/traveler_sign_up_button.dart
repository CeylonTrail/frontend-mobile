import 'package:ceylontrailapp/screen/user_role_screen.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TravelerSignUpButton extends StatelessWidget {
  const TravelerSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => const UserRoleScreen(),
          ),
        );
      },
      child: Center(
        child: Container(
          height: 66,
          width: screenWidth - 40,
          decoration: BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(
              "Traveler",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
