import 'package:ceylontrailapp/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        preferredSize: const Size.fromHeight(101.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            children: [
              // const SizedBox(height: 36),
              AppBar(
                backgroundColor: AppTheme.colors.primary,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/bx-menu.svg',
                    width: 24, // Explicitly set icon size
                    height: 24, // Explicitly set icon size
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
                            'assets/icons/bx-search.svg',
                            width: 24, // Explicitly set icon size
                            height: 24, // Explicitly set icon size
                          ),
                          onPressed: () {
                            // Handle search icon press
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/bx-message-rounded.svg',
                            width: 24, // Explicitly set icon size
                            height: 24, // Explicitly set icon size
                          ),
                          onPressed: () {
                            // Handle chat icon press
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/bx-bell.svg',
                            width: 24, // Explicitly set icon size
                            height: 24, // Explicitly set icon size
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
                    bottom: Radius.circular(22),
                    top: Radius.circular(22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      drawer: const Drawer(child: SideBar()),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark, // Set the status bar text to dark
        child: SafeArea(child: homeScreen),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
