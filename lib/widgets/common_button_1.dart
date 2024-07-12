import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CommonButton1 extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  // final VoidCallback onTap;

  const CommonButton1({
    super.key,
    this.text = 'Back',
    required this.textColor,
    required this.buttonColor,
    // required this.onTap,
  }) : assert(textColor != null && buttonColor != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
