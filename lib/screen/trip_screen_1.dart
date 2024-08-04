import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../widgets/trip_appbar_1.dart';
import 'trip_screen_2.dart';

class TripScreen1 extends StatefulWidget {
  const TripScreen1({super.key});

  @override
  TripScreen1State createState() => TripScreen1State();
}

class TripScreen1State extends State<TripScreen1> {
  final PageController _pageController = PageController();
  bool isEditMode = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  void _onNextPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TripAppbar1(
      content: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildFirstPage(),
          const TripScreen2(),
        ],
      ),
      isEditMode: isEditMode,
      onEditModeToggle: toggleEditMode,
      onNextPressed: _onNextPressed,
    );
  }

  Widget _buildFirstPage() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
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
                decoration: InputDecoration(
                  hintText: 'Ex:- Ella',
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
                decoration: InputDecoration(
                  hintText: 'Ex:- 2',
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
                  // Check if the value is a valid number
                  final number = num.tryParse(value);
                  if (number == null) {
                    return 'Please enter a valid number';
                  }
                  return null; // Return null if validation passes
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
                  border: Border.all(color: AppTheme.colors.primary_dark_3, width: 2),
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

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.start,
                  'Add Travel Buddies?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.colors.primary_dark_3,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex:- @leodicap',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
