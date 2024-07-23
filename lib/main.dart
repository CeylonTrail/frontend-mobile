import 'package:ceylontrailapp/screen/forgot_password_screen.dart';
import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:ceylontrailapp/screen/otp_verification_screen.dart';
import 'package:ceylontrailapp/screen/reset_password_screen.dart';
import 'package:ceylontrailapp/screen/splash_screen.dart';
import 'package:ceylontrailapp/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/sign_in_screen.dart';
import 'package:ceylontrailapp/screen/sign_up_screen.dart';

void main() {
  // Set the status bar and navigation bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make the status bar transparent
    statusBarIconBrightness: Brightness.dark, // Set the status bar icons to dark
    systemNavigationBarColor: Colors.white, // Set the navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, // Set the navigation bar icons to dark
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CeylonTrail',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const WelcomeScreen()),
        GetPage(name: '/sign_in', page: () => const SignInScreen()),
        GetPage(name: '/sign_up', page: () => const SignUpScreen()),
        GetPage(name: '/forgot_password', page: () => const ForgotPasswordScreen()),
        GetPage(name: '/otp_verification', page: () => const OtpVerificationScreen()),
        GetPage(name: '/reset_password', page: () => const ResetPasswordScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
