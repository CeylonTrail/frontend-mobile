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
      final selectedDay = controller.selectedDay.value;
      final numberOfDays = controller.numberOfDays.value;
      final destinationName = controller.destinationName.value;

      return SingleChildScrollView(
        child: Padding(
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
              // Divider(
              //   height: 2,
              //   color: AppTheme.colors.primary_dark_3,
              // ),

              SizedBox(
                height: size.height * 0.79,
                width: size.width * 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          color: Colors.green,
                          width: double.infinity,
                          height: 300,
                        ),
                      ),
                      Container(
                        height: size.height * 0.388,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8),
                          child: Row(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    TripTimeline(isFirst: true, isLast: false, isPast: true),
                                    TripTimeline(isFirst: false, isLast: false, isPast: true),
                                    TripTimeline(isFirst: false, isLast: true, isPast: false),
                                    TripTimeline(isFirst: true, isLast: false, isPast: true),
                                    TripTimeline(isFirst: false, isLast: false, isPast: true),
                                    TripTimeline(isFirst: false, isLast: true, isPast: false),
                                  ],
                                ),
                              ),
                              Column(
                                children: [

                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      );
    });
  }
}
