import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class TripAppbar2 extends StatefulWidget {
  const TripAppbar2({
    super.key,
    required this.content,
    this.bottomNavBar,
    required this.isEditMode,
    required this.onEditModeToggle,
  });

  final Widget content;
  final Widget? bottomNavBar;
  final bool isEditMode;
  final VoidCallback onEditModeToggle;

  @override
  State<TripAppbar2> createState() => _TripAppbar2State();
}

class _TripAppbar2State extends State<TripAppbar2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
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
                    color: AppTheme.colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 80,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppTheme.colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Plan a Trip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppTheme.colors.primary_dark_3,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onEditModeToggle(); // Call the callback here
                          Get.offNamed('/home'); // Navigate to the home screen
                        }, // Call the callback here
                        child: Container(
                          alignment: Alignment.center,
                          width: 82,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Text(
                            'Save', // Always show 'Save' here
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppTheme.colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
