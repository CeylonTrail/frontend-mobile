import 'package:ceylontrailapp/widgets/trip_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/app_theme.dart';
import '../controllers/trip_plan_controller.dart';

class TripScreen3 extends StatefulWidget {
  const TripScreen3({super.key});

  @override
  State<TripScreen3> createState() => _TripScreen3State();
}

class _TripScreen3State extends State<TripScreen3> {
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);

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
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  children: [
                    // Map Container
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary_dark_1,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: SizedBox(
                            height: double.infinity,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: _pGooglePlex,
                                zoom: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Places List Container
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.colors.secondary_light_1,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: List.generate(
                              allPlaces.length,
                                  (index) {
                                final isPast = index <= allPlaces.length - 1;
                                final placeName = allPlaces[index]['place'];
                                final completed =
                                allPlaces[index]['completed'];

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
