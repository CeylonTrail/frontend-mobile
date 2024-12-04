import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/trip_plan_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/bot_scaffold.dart';
import '../widgets/trip_appbar.dart';
import 'trip_screen_2.dart';
import 'trip_screen_3.dart';

class TripScreen1 extends StatefulWidget {
  const TripScreen1({super.key});

  @override
  TripScreen1State createState() => TripScreen1State();
}

class TripScreen1State extends State<TripScreen1> {
  final PageController _pageController = PageController();
  bool isEditMode = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _currentPageIndex = 0;
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Ensure the TripPlanController is initialized
    Get.put(TripPlanController());
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  void _onNextPressed() {
    if(_currentPageIndex == 0){
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
    if (_formKey.currentState?.validate() ?? false) {
      final numberOfDays = int.tryParse(_daysController.text) ?? 0;
      print("Number of days entered: $numberOfDays"); // Debug print
      Get.find<TripPlanController>().goToNextPage(
        _destinationController.text,
        numberOfDays,
      );
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPageIndex += 1;
      });
    }
  }

  void _onDiscard() {
    // Clear text controllers
    _destinationController.clear();
    _daysController.clear();

    // Reset the form state
    _formKey.currentState?.reset();

    // Reset page controller to the first page
    _pageController.jumpToPage(0);

    // Reset the current page index
    setState(() {
      _currentPageIndex = 0;
    });

    // Reset the TripPlanController state
    Get.find<TripPlanController>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return BotScaffold(
      body: TripAppbar(
        content: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildFirstPage(),
            const TripScreen2(),
            const TripScreen3(), // Add the third screen here
          ],
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
        isEditMode: isEditMode,
        onEditModeToggle: toggleEditMode,
        onNextPressed: _onNextPressed,
        currentPageIndex: _currentPageIndex,
        pageController: _pageController,
        onDiscard: _onDiscard, // Ensure this is correctly assigned
      ),
    );
  }

  Widget _buildFirstPage() {
    return ColoredBox(
      color: AppTheme.colors.white,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    'Where to?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.colors.primary_dark_3,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    hintText: 'Ex:- Kandy',
                    hintStyle: TextStyle(
                      color: AppTheme.colors.secondary_light_2,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.secondary_light_3,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.primary_dark_3,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.primary_dark_3,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a destination';
                    }
                    if (RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Destination cannot contain numbers';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    'How many days?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.colors.primary_dark_3,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _daysController,
                  decoration: InputDecoration(
                    hintText: 'Ex:- 3',
                    hintStyle: TextStyle(
                      color: AppTheme.colors.secondary_light_2,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.secondary_light_3,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.primary_dark_3,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppTheme.colors.primary_dark_3,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the number of days';
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    'Trip description (Optional)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.colors.primary_dark_3,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.colors.primary_dark_3, width: 2),
                    color: AppTheme.colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Trip description...",
                        hintStyle: TextStyle(
                          color: AppTheme.colors.secondary_light_2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        border: InputBorder.none,
                      ),
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
