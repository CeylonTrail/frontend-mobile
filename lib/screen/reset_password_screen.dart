import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:ceylontrailapp/widgets/user_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/reset_password_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formResetPasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScaffoldLoading(
        loadingScreen: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(height: size.height * 0.01),
            ),
            Expanded(
                flex: 5,
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
                        key: _formResetPasswordKey,
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
                                    "Reset Password",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.colors.primary,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      'New Password',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.colors.primary_dark_3),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter a New Password',
                                      hintStyle: TextStyle(
                                          color: AppTheme.colors.secondary_light_2),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color:
                                            AppTheme.colors.secondary_light_3,
                                            width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: AppTheme.colors.primary_dark_3,
                                            width: 2),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: AppTheme.colors.primary_dark_3,
                                            width: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      'Confirm Password',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.colors.primary_dark_3),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Confirm New Password',
                                      hintStyle: TextStyle(
                                          color: AppTheme.colors.secondary_light_2),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color:
                                            AppTheme.colors.secondary_light_3,
                                            width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: AppTheme.colors.primary_dark_3,
                                            width: 2),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: AppTheme.colors.primary_dark_3,
                                            width: 2),
                                      ),
                                    ),
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
