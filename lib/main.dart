import 'package:ceylontrailapp/screen/current_trip_screen.dart';
import 'package:ceylontrailapp/screen/forgot_password_screen.dart';
import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:ceylontrailapp/screen/messages.dart';
import 'package:ceylontrailapp/screen/newsfeed.dart';
import 'package:ceylontrailapp/screen/notifications.dart';
import 'package:ceylontrailapp/screen/otp_verification_screen.dart';
import 'package:ceylontrailapp/screen/reset_password_screen.dart';
import 'package:ceylontrailapp/screen/splash_screen.dart';
import 'package:ceylontrailapp/screen/trip_screen_1.dart';
import 'package:ceylontrailapp/screen/trip_screen_2.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/sign_in_screen.dart';
import 'package:ceylontrailapp/screen/sign_up_screen.dart';

import 'controllers/marketplace_controller.dart';
import 'controllers/newsfeed_controller.dart';
import 'controllers/trip_plan_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  // Set the status bar and navigation bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make the status bar transparent
    statusBarIconBrightness: Brightness.dark, // Set the status bar icons to dark
    systemNavigationBarColor: Colors.white, // Set the navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, // Set the navigation bar icons to dark
  ));

  // Get.lazyPut(() => UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TripPlanController());
    Get.put(NewsfeedController());
    Get.put(MarketplaceItemController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CeylonTrail',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/sign_in', page: () => const SignInScreen()),
        GetPage(name: '/sign_up', page: () => const SignUpScreen()),
        GetPage(name: '/forgot_password', page: () => const ForgotPasswordScreen()),
        GetPage(name: '/otp_verification', page: () => const OtpVerificationScreen()),
        GetPage(name: '/reset_password', page: () => const ResetPasswordScreen()),
        // GetPage(name: '/home', page: () => const HomeScreen()),
        // GetPage(name: '/myprofile', page: () => const HomeScreen()),
        GetPage(name: '/newsfeed', page: () => const NewsFeed()),
        GetPage(name: '/messages', page: () => const Messages()),
        GetPage(name: '/notifications', page: () => const Notifications()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home:  const SplashScreen(),
    );
  }
}
