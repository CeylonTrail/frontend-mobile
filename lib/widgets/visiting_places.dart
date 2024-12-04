import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/trip_plan_controller.dart';
import '../theme/app_theme.dart';
class VisitingPlaces extends StatelessWidget {
  final String placeName;

  const VisitingPlaces({super.key, required this.placeName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TripPlanController>();

    // Get the image for the place
    final placeImage = controller.placeImages[placeName];

    return Row(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 200,
              height: 25,
              child: Text(
                placeName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colors.secondary_light_3,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 125,
                width: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: placeImage != null
                      ? Image.asset(
                    placeImage,
                    fit: BoxFit.fitWidth,
                  )
                      : Container(), // Default to an empty container if the image is missing
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 10),
          child: Container(
            height: 125,
            width: 60,
            decoration: BoxDecoration(
              color: AppTheme.colors.secondary_light_1,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                controller.addPlaceToDay(placeName);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.colors.secondary_light_3,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/bxs-plus-circle-grey.svg',
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
