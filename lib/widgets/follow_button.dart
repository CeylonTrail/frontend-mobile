import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  FollowButtonState createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: toggleFollow,
        child: Container(
          width: 100,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          decoration: BoxDecoration(
            color: isFollowing ? AppTheme.colors.white : AppTheme.colors.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.colors.primary, width: 2),
          ),
          child: Text(
            isFollowing ? 'Unfollow' : 'Follow',
            style: TextStyle(
              color: isFollowing ? AppTheme.colors.primary : AppTheme.colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}