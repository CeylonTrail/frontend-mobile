import 'package:ceylontrailapp/screen/sign_in_screen.dart';
import 'package:ceylontrailapp/screen/user_role_screen.dart';
import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:ceylontrailapp/widgets/sign_up_button.dart';
import 'package:ceylontrailapp/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return CustomScaffoldLoading(
      loadingScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 40.0,
            ),
            child: Stack(
              children: [
                RichText(
                  text: TextSpan(
                    text: "CeylonTrail",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SignIn(
                    onTap: SignInScreen(),
                  )],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SignUp(
                    onTap: UserRoleScreen(),
                  )],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
