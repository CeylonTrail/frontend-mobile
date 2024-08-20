import 'package:ceylontrailapp/screen/recommended_trip_plans_screen.dart';
import 'package:ceylontrailapp/screen/trip_plan_details.dart'; // Import the details page
import 'package:ceylontrailapp/widgets/trip_plan_card.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:get/get.dart';
import '../models/recommended_trip_plan_model.dart'; // Import the model

class RecommendedTripPlans extends StatelessWidget {
  const RecommendedTripPlans({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a sample plan to pass into TripPlanCard
    RecommendedTripPlan plan = RecommendedTripPlan(
      title: "Ella",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      days: '2',
      description: 'A 2 days trip to Ella',
      location: 'Badulla',
    );

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended Trip Plans",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.colors.black,
                      fontWeight: FontWeight.w900),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const RecommendedTripPlansScreen());
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.colors.primary,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                  height: 240,
                  child: TripPlanCard(
                    plan: plan,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPlanDetailsPage(item: plan),
                        ),
                      );
                    },
                  ),
                ),
                // You can add more TripPlanCards here if needed
              ],
            ),
          )
        ],
      ),
    );
  }
}
