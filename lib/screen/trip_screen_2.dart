import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trip_plan_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/added_places.dart';
import '../widgets/visiting_places.dart';

class TripScreen2 extends StatelessWidget {
  const TripScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<TripPlanController>();

    return Obx(() {
      final numberOfDays = controller.numberOfDays.value;
      final selectedDay = controller.selectedDay.value;
      final destinationName = controller.destinationName.value;

      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Wrap(
                  spacing: 10,
                  children: List.generate(
                    numberOfDays,
                    (index) {
                      final day = index + 1;
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          // Set elevation to 0
                          backgroundColor: selectedDay == day
                              ? AppTheme.colors.white
                              : AppTheme.colors.primary_dark_3,
                          // Change color based on selection
                          minimumSize: const Size(80, 40),
                          // Set width and height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            // Set border radius
                            side: BorderSide(
                                color: selectedDay == day
                                    ? AppTheme.colors.primary
                                    : AppTheme.colors.white,
                                width: 2), // Set border color and width
                          ),
                        ),
                        onPressed: () {
                          controller.selectDay(day);
                        },
                        child: Text(
                          'Day $day',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedDay == day
                                ? AppTheme.colors.primary
                                : AppTheme.colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Places near ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppTheme.colors.primary_dark_3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          destinationName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppTheme.colors.secondary_dark_2,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.colors.black,
                    thickness: 1,
                  ),
                  controller.remainingPlaces.isEmpty
                      ? Center(
                          child: Text(
                            "List empty",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppTheme.colors.primary_dark_3,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              children: controller.remainingPlaces
                                  .map((place) =>
                                      VisitingPlaces(placeName: place))
                                  .toList(),
                            ),
                          ),
                        ),
                  Divider(
                    color: AppTheme.colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Day $selectedDay destinations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppTheme.colors.primary_dark_3,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.54,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: controller.addedPlaces[selectedDay]
                                ?.map((place) => AddedPlaces(placeName: place))
                                .toList() ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
