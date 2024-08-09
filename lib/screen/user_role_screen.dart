import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:ceylontrailapp/widgets/service_provider_sign_up_button.dart';
import 'package:ceylontrailapp/widgets/traveler_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRoleScreen extends StatelessWidget {
  const UserRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScaffoldLoading(
      loadingScreen: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (e) => const UserRoleScreen(),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: RichText(
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
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.4),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: size.height * 0.6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Container(
                                  height: size.height * 0.4,
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                        text: "Sign up as a",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.colors.primary,
                                            fontSize: 40,
                                          ),
                                        ),
                                      )),
                                      SizedBox(height: size.height * 0.03),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [TravelerSignUpButton()],
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ServiceProviderSignUpButton()
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                            text: "Already have an account? ",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: AppTheme.colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )),
                                          RichText(
                                              text: TextSpan(
                                            text: "Sign in",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: AppTheme.colors.primary,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
