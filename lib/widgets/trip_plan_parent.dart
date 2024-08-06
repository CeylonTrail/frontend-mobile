import 'package:flutter/material.dart';
import '../widgets/trip_appbar.dart';
import '../screen/trip_screen_1.dart';
import '../screen/trip_screen_2.dart';
import '../screen/trip_screen_3.dart';

class TripPlanParent extends StatefulWidget {
  const TripPlanParent({super.key});

  @override
  TripPlanParentState createState() => TripPlanParentState();
}

class TripPlanParentState extends State<TripPlanParent> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  bool _isEditMode = false;

  void _onEditModeToggle() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  void _onNextPressed() {
    if (_currentPageIndex < 2) {
      setState(() {
        _currentPageIndex++;
      });
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      ).then((_) {
        // Debugging: Check if the page index is correct
        print("Navigated to page: $_currentPageIndex");
      });
    } else {
      // Save functionality can be added here
      print("Save button pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TripAppbar(
            pageController: _pageController,
            content: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: const [
                TripScreen1(),
                TripScreen2(),
                TripScreen3(),
              ],
            ),
            isEditMode: _isEditMode,
            onEditModeToggle: _onEditModeToggle,
            onNextPressed: _onNextPressed,
            currentPageIndex: _currentPageIndex,
          ),
        ],
      ),
    );
  }
}