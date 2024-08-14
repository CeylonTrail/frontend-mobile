import 'package:ceylontrailapp/widgets/trip_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../controllers/trip_plan_controller.dart';

class TripScreen3 extends StatelessWidget {
  const TripScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() {
      final controller = Get.find<TripPlanController>();
      final numberOfDays = controller.numberOfDays.value;
      final destinationName = controller.destinationName.value;

      // Create a combined list of places for all days
      final List<Map<String, dynamic>> allPlaces = [];
      for (int day = 1; day <= numberOfDays; day++) {
        final places = controller.addedPlaces[day] ?? [];
        for (final place in places) {
          allPlaces.add({
            "day": day,
            "place": place,
            "completed": false, // Initially mark all as not completed
          });
        }
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            SizedBox(
              height: size.height * 0.82,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          color: AppTheme.colors.primary_dark_1,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    Container(
                      height: size.height * 0.42,
                      decoration: BoxDecoration(
                          color: AppTheme.colors.secondary_light_1,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                            allPlaces.length,
                                (index) {
                              final isPast = index <= allPlaces.length - 1;
                              final placeName = allPlaces[index]['place'];
                              final completed = allPlaces[index]['completed'];

                              return TripTimeline(
                                isFirst: index == 0,
                                isLast: index == allPlaces.length - 1,
                                isPast: isPast,
                                placeName: '$placeName',
                                completed: completed,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
