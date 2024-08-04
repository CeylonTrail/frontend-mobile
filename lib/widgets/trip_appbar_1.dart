import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../theme/app_theme.dart';

class TripAppbar1 extends StatefulWidget {
  const TripAppbar1({
    super.key,
    required this.content,
    this.bottomNavBar,
    required this.isEditMode,
    required this.onEditModeToggle,
    required this.onNextPressed,
  });

  final Widget content;
  final Widget? bottomNavBar;
  final bool isEditMode;
  final VoidCallback onEditModeToggle;
  final VoidCallback onNextPressed;

  @override
  State<TripAppbar1> createState() => _TripAppbar1State();
}

class _TripAppbar1State extends State<TripAppbar1> {
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
    BackButtonInterceptor.add(_backButtonInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(_backButtonInterceptor);
    super.dispose();
  }

  bool _backButtonInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    _showDiscardDialog();
    return true;
  }

  Future<void> _showDiscardDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Discard trip?',
          style: TextStyle(
            color: AppTheme.colors.primary_dark_3,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to discard this trip?',
          style: TextStyle(
            color: AppTheme.colors.secondary_dark_2,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(
              'No',
              style: TextStyle(color: AppTheme.colors.secondary_dark_2),
            ),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              'Yes',
              style: TextStyle(color: AppTheme.colors.primary),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      body: Column(
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
                        _showDiscardDialog();
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
                      onTap: widget.onNextPressed,
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
                          'Next',
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
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
