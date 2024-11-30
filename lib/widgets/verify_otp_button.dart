import 'package:ceylontrailapp/screen/reset_password_screen.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Get.to(ResetPasswordScreen());
      },
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
              "Verify OTP",
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
