import 'package:ceylontrailapp/screen/emergency_services.dart';
import 'package:ceylontrailapp/screen/marketplace.dart';
import 'package:ceylontrailapp/screen/voice_assistant.dart';
import 'package:ceylontrailapp/widgets/appbar_scaffold.dart';
import 'package:ceylontrailapp/widgets/bottom_nav_bar.dart';
import 'package:ceylontrailapp/widgets/current_trip_button.dart';
import 'package:ceylontrailapp/widgets/favorites_button.dart';
import 'package:ceylontrailapp/widgets/plan_a_trip_button.dart';
import 'package:ceylontrailapp/widgets/popular_destinations.dart';
import 'package:ceylontrailapp/widgets/previous_trips.dart';
import 'package:ceylontrailapp/widgets/recommended_trip_plans.dart';
import 'package:ceylontrailapp/widgets/weather_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/news_feed.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../widgets/back_button_interceptor.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());

    return BackButtonInterceptor(
      child: AppbarScaffold(
        homeScreen: Obx(() {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlanATripButton(),
                        FavoritesButton()
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CurrentTripButton(),
                        WeatherButton()
                      ],
                    ),
                    SizedBox(height: 8),
                    RecommendedTripPlans(),
                    PopularDestinations(),
                    PreviousTrips(),

                  ],
                ),
              ),
              NewsFeed(),
              Marketplace(),
              VoiceAssistant(),
              EmergencyServices(),
              // Add other screens here
            ],
          );
        }),
        bottomNavBar: const BottomNavBar(),
      ),
    );
  }
}
