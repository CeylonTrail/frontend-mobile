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
    RecommendedTripPlan plan1 = RecommendedTripPlan(
      title: "Ella",
      imageUrls: [
        "assets/images/ella_1.jpg",
        "assets/images/ella_2.jpg",
        "assets/images/ella_3.jpg",
        "assets/images/ella_4.jpg",
      ],
      days: '2',
      description: 'A 2 days trip to Ella Rock, Ravana Cave, Flying Ravana, Little Adams peak',
      location: 'Badulla', coordinates: [],
    );
    RecommendedTripPlan plan2 = RecommendedTripPlan(
      title: "Kandy",
      imageUrls: [
        "assets/images/kandy_1.jpg",
        "assets/images/kandy_2.jpg",
        "assets/images/kandy_3.jpg",
        "assets/images/kandy_4.jpg",
      ],
      days: '3',
      description: 'A 3 days trip to Temple of Relic, Kandy Lake, Udawatta Kele Sanctuary, Royal Botanical Gardens, Embekke Dewalaya, Ambuluwawa Tower, Sri Natha Dewalaya, Royal Palace Park',
      location: 'Kandy', coordinates: [],
    );
    RecommendedTripPlan plan3 = RecommendedTripPlan(
      title: "Anuradhapura",
      imageUrls: [
        "assets/images/anuradhapura_1.jpg",
        "assets/images/anuradhapura_2.jpg",
        "assets/images/anuradhapura_3.jpg",
        "assets/images/anuradhapura_4.jpg",
      ],
      days: '3',
      description: 'A 3 days trip to Anuradhapura',
      location: 'Anuradhapura', coordinates: [],
    );
    RecommendedTripPlan plan4 = RecommendedTripPlan(
      title: "Galle",
      imageUrls: [
        "assets/images/galle_1.jpg",
        "assets/images/galle_2.jpg",
        "assets/images/galle_3.jpg",
        "assets/images/galle_4.jpg",
      ],
      days: '1',
      description: 'A 1 day trip to Galle',
      location: 'Galle', coordinates: [],
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
                    plan: plan1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPlanDetailsPage(item: plan1),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 240,
                  child: TripPlanCard(
                    plan: plan2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPlanDetailsPage(item: plan2),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 240,
                  child: TripPlanCard(
                    plan: plan3,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPlanDetailsPage(item: plan3),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 240,
                  child: TripPlanCard(
                    plan: plan4,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPlanDetailsPage(item: plan4),
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
