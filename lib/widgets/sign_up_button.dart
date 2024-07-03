import 'package:ceylontrailapp/screen/user_role_screen.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, this.onTap});
  final Widget? onTap;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Center(
        child: Container(
          height: 66,
          width: screenWidth - 40,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.colors.primary
              ),
            ),
          ),
        ),
      ),
    );
  }
}
