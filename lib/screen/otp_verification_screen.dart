import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_scaffold_loading.dart';
import '../widgets/reset_password_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScaffoldLoading(
        loadingScreen: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(height: size.height * 0.01),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                        // key: _formForgotPasswordKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 15),
                                  Text(
                                    "OTP Verification",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.colors.primary,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  const Text(
                                    "Please check your email inbox for the OTP code",
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      'OTP Code',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.colors.primary_dark_3),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                   Row(
                                    children: [
                                      Container(
                                        height: 64,
                                        width: 64,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                                        ),
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none, // Remove the default TextField border
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  const ResetPasswordButton(),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ))
          ],
        ));
  }
}
