import 'package:ceylontrailapp/widgets/bot_scaffold.dart';
import 'package:ceylontrailapp/widgets/custom_follow_appbar.dart';
import 'package:ceylontrailapp/widgets/follower_following_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BotScaffold(
      body: const CustomFollowAppbar(
          title: 'Followers',
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
          )), currentIndex: null,
    );
  }
}
