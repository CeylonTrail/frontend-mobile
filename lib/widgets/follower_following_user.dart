import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'follow_button.dart';

class FollowerFollowingUser extends StatelessWidget {
  const FollowerFollowingUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppTheme.colors.secondary_light_1),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/img.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {
                  //method
                },
                child: Text(
                  'Leonardo Dicaprio',
                  style: TextStyle(
                      color: AppTheme.colors.primary_dark_3,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            const FollowButton()
          ],
        ),
      ),
    );
  }
}
