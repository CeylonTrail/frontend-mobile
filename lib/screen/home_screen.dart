import 'package:ceylontrailapp/widgets/appbar_scaffold.dart';
import 'package:ceylontrailapp/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppbarScaffold(
      homeScreen: const Column(
        children: [
          Text("ddddddddddd"),
          // Add other widgets for the home screen here
        ],
      ),
      bottomNavBar: const BottomNavBar(),
    );
  }
}
