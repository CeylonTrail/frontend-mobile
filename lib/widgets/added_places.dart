import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trip_plan_controller.dart';
import '../theme/app_theme.dart';

class AddedPlaces extends StatelessWidget {
  final String placeName;

  const AddedPlaces({super.key, required this.placeName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TripPlanController>();

    return ListTile(
      title: Text(
        placeName,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppTheme.colors.primary_dark_3,
          fontSize: 18,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle, color: AppTheme.colors.secondary),
        onPressed: () {
          controller.removePlaceFromDay(placeName);
        },
      ),
    );
  }
}
