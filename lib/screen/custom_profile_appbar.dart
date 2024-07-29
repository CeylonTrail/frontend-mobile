import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar(
      {super.key, required this.homeScreen, this.bottomNavBar});

  final Widget homeScreen;
  final Widget? bottomNavBar;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          // Ensures status bar background is white
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
