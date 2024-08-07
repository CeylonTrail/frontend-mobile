import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TripScreen3 extends StatelessWidget {
  const TripScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                'Screen 3',
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
                hintText: 'Ex:- By Train',
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

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                'Accommodation',
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
                hintText: 'Ex:- Hotel XYZ',
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

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                'Activities',
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
                hintText: 'Ex:- Hiking, Sightseeing',
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

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.start,
                'Budget',
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
                hintText: 'Ex:- Rs1000',
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
                  return 'Please enter the budget';
                }
                // Check if the value is a valid number
                final number = num.tryParse(value);
                if (number == null) {
                  return 'Please enter a valid number';
                }
                return null; // Return null if validation passes
              },
            ),
          ],
        ),
      ),
    );
  }
}
