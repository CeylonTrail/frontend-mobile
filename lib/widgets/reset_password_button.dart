import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 50,
          width: screenWidth - 40,
          decoration: BoxDecoration(
            color: AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(
              "Reset Password",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
