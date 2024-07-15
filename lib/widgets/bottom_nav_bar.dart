import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.colors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: AppTheme.colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
