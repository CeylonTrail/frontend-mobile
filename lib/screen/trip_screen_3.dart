import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../controllers/trip_plan_controller.dart';

class TripScreen3 extends StatelessWidget {
  const TripScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<TripPlanController>();
      final selectedDay = controller.selectedDay.value;
      final numberOfDays = controller.numberOfDays.value;
      final destinationName = controller.destinationName.value;

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  numberOfDays == 1
                      ? '1 Day trip to $destinationName'
                      : '$numberOfDays Day trip to $destinationName',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppTheme.colors.primary_dark_3,
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: AppTheme.colors.primary_dark_3,
              ),
              Row(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        
                      ],
                    ),
                  ),
                  Column(
                    children: [

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
