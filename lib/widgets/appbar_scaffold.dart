import 'package:ceylontrailapp/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class AppbarScaffold extends StatelessWidget {
  AppbarScaffold({super.key, required this.homeScreen, this.bottomNavBar});

  final Widget homeScreen;
  final Widget? bottomNavBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set the desired height here
        child: AppBar(
          backgroundColor: AppTheme.colors.primary,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              height: 24, // Adjust the size as needed
              width: 24,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      height: 32, // Adjust the size as needed
                      width: 32,
                    ),
                    onPressed: () {
                      // Handle search icon press
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/chat-bubble.svg',
                      height: 22, // Adjust the size as needed
                      width: 22,
                    ),
                    onPressed: () {
                      // Handle chat icon press
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      height: 24, // Adjust the size as needed
                      width: 24,
                    ),
                    onPressed: () {
                      // Handle notifications icon press
                    },
                  ),
                ],
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(22), // Adjust as needed
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      drawer: const Drawer(
        child: SideBar(),
      ),
      body: SafeArea(child: homeScreen),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
