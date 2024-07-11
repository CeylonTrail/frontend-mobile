import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const BackButtonWidget({
    super.key,
    this.text = 'Back',
    this.icon = Icons.arrow_back,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: AppTheme.colors.primary,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 4.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: AppTheme.colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
