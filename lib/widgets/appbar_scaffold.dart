import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppbarScaffold extends StatelessWidget {
  const AppbarScaffold({super.key, required this.homeScreen});

  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          leading: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/img.png')),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              // Adjust the padding value as needed
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print('Search icon pressed');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              // Adjust the padding value as needed
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  print('Notifications icon pressed');
                },
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [SafeArea(child: homeScreen)],
        ));
  }
}
