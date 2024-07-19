import 'package:flutter/material.dart';

import '../widgets/social_media_post.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SocialMediaPost()
      ],

    );
  }
}
