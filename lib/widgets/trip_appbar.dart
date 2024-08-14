import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../controllers/trip_plan_controller.dart';
import '../theme/app_theme.dart';

class TripAppbar extends StatefulWidget {
  const TripAppbar({
    super.key,
    required this.content,
    this.bottomNavBar,
    required this.isEditMode,
    required this.onEditModeToggle,
    required this.onNextPressed,
    required this.currentPageIndex,
    required this.pageController,
    required this.onDiscard, // Add this line
  });

  final Widget content;
  final Widget? bottomNavBar;
  final bool isEditMode;
  final VoidCallback onEditModeToggle;
  final VoidCallback onNextPressed;
  final int currentPageIndex;
  final PageController pageController;
  final VoidCallback onDiscard; // Add this line

  @override
  State<TripAppbar> createState() => _TripAppbarState();
}

class _TripAppbarState extends State<TripAppbar> {
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
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'No',
              style: TextStyle(color: AppTheme.colors.primary_light_1),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Yes',
              style: TextStyle(color: AppTheme.colors.warning_light),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      widget.onDiscard(); // Call the discard callback
      Navigator.pop(context);
    }
  }

  void _handleBackPressed() {
    if (widget.currentPageIndex > 0) {
      widget.pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _showDiscardDialog();
    }
  }

  void _handleNextPressed() {
    final controller = Get.find<TripPlanController>();
    // Check if the list of destinations is empty
    if(widget.currentPageIndex == 1){
      if (controller.addedPlaces[controller.selectedDay.value]?.isEmpty ?? true) {
        // Show error message if no destinations are selected
        Get.snackbar(
          'Error',
          'Please select 1 or more destinations.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,

        );
      } else {
        widget.onNextPressed();
      }
    }else{
      widget.onNextPressed();
    }

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
                        onTap: _handleBackPressed,
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
                        onTap: _handleNextPressed,
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
                            widget.currentPageIndex >= 2 ? 'Save' : 'Next',
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
