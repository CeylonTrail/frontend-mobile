import 'package:ceylontrailapp/screen/information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class CustomMyProfileAppbar extends StatefulWidget {
  const CustomMyProfileAppbar(
      {super.key,
      required this.content,
      this.bottomNavBar,
      this.showMoreButton = true});

  final Widget content;
  final Widget? bottomNavBar;
  final bool showMoreButton;

  @override
  State<CustomMyProfileAppbar> createState() => _CustomProfileAppbarState();
}

class _CustomProfileAppbarState extends State<CustomMyProfileAppbar> {
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
                      color:
                          AppTheme.colors.white // Explicitly setting to white
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppTheme.colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppTheme.colors.primary_dark_3),
                      ),
                      if (widget.showMoreButton)
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const InformationScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: AppTheme.colors.primary,
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if(!widget.showMoreButton)
                       const SizedBox(width: 82,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: widget.content,
            ),
          ],
        ),
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
