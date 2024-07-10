import 'package:ceylontrailapp/widgets/appbar_scaffold.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppbarScaffold(homeScreen:
        Column(
          children: [
            Text("ddddddddddd")
          ],
        )
    );
  }
}
