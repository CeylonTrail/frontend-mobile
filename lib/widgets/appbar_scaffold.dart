import 'package:ceylontrailapp/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class AppbarScaffold extends StatefulWidget {
  const AppbarScaffold({super.key, required this.homeScreen, this.bottomNavBar});

  final Widget homeScreen;
  final Widget? bottomNavBar;

  @override
  AppbarScaffoldState createState() => AppbarScaffoldState();
}

class AppbarScaffoldState extends State<AppbarScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // Ensures status bar background is white
          statusBarIconBrightness: Brightness.dark, // Sets icons to dark color
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: const Drawer(child: SideBar()),
      body: ColoredBox(
        color: AppTheme.colors.white,
        child: Column(
          children: [
            const SizedBox(height: 36),
            SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppTheme.colors.primary// Explicitly setting to white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/bx-menu.svg'),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: widget.homeScreen,
            ),
          ],
        ),
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
