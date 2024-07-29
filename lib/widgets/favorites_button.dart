import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FavoritesButton extends StatelessWidget {
  const FavoritesButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Return a TextButton with rounded corners
    return TextButton(
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
              'assets/icons/bxs-heart.svg',
            ),
            const SizedBox(width: 10),
            Text(
              'Favorites',
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
