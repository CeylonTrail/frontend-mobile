import 'package:ceylontrailapp/screen/emergency_services.dart';
import 'package:ceylontrailapp/screen/marketplace.dart';
import 'package:ceylontrailapp/screen/voice_assistant.dart';
import 'package:ceylontrailapp/widgets/appbar_scaffold.dart';
import 'package:ceylontrailapp/widgets/bottom_nav_bar.dart';
import 'package:ceylontrailapp/widgets/current_trip_button.dart';
import 'package:ceylontrailapp/widgets/favorites_button.dart';
import 'package:ceylontrailapp/widgets/my_trips_widget.dart';
import 'package:ceylontrailapp/widgets/plan_a_trip_button.dart';
import 'package:ceylontrailapp/widgets/popular_destinations.dart';
import 'package:ceylontrailapp/widgets/previous_trips.dart';
import 'package:ceylontrailapp/widgets/recommended_trip_plans.dart';
import 'package:ceylontrailapp/widgets/weather_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/newsfeed.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/back_button_interceptor.dart';
import '../widgets/bot_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());

    return BackButtonInterceptor(
      child: Obx(() {
        return BotScaffold(
          body: AppbarScaffold(
            homeScreen: ColoredBox(
              color: AppTheme.colors.white,
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: const [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlanATripButton(),

                            CurrentTripButton(),
                          ],
                        ),
                        // SizedBox(height: 8),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     FavoritesButton(),
                        //     WeatherButton(),
                        //   ],
                        // ),
                        SizedBox(height: 8),
                        RecommendedTripPlans(),
                        PopularDestinations(),
                        MyTripsWidget(),
                        PreviousTrips(),

                      ],
                    ),
                  ),
                  NewsFeed(),
                  Marketplace(),
                  // VoiceAssistant(),
                  EmergencyServices(),
                ],
              ),
            ), currentIndex: controller.selectedIndex.value,
          ),
          currentIndex: controller.selectedIndex.value,
          bottomNavBar: const BottomNavBar(),
        );
      }),
    );
  }
}
