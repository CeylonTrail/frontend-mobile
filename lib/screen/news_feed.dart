import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("News Feed"),
    );
  }
}
