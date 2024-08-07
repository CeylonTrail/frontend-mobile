import 'package:ceylontrailapp/widgets/custom_follow_appbar.dart';
import 'package:ceylontrailapp/widgets/follower_following_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFollowAppbar(
        title: 'Following',
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
              FollowerFollowingUser(),
            ],
          ),
        ));
  }
}
