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
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: AppBar(
              backgroundColor: AppTheme.colors.primary,
              leading: IconButton(
                icon: SvgPicture.asset('assets/icons/bx-menu.svg'),
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
                        icon: SvgPicture.asset('assets/icons/bx-search.svg'),
                        onPressed: () {
                          // Handle search icon press
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/bx-message-rounded.svg'),
                        onPressed: () {
                          // Handle chat icon press
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/bx-bell.svg'),
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
                    top: Radius.circular(22)
                ),
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        drawer: const Drawer(child: SideBar()),
        body: SafeArea(child: homeScreen),
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}
