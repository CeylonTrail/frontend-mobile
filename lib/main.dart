import 'package:ceylontrailapp/screen/forgot_password_screen.dart';
import 'package:ceylontrailapp/screen/otp_verification_screen.dart';
import 'package:ceylontrailapp/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/sign_in_screen.dart';
import 'package:ceylontrailapp/screen/sign_up_screen.dart';

void main() {
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
          GetPage(name: '/otp_verification', page: () => const OtpVerificationScreen())
        ],

        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const WelcomeScreen());
  }
}

