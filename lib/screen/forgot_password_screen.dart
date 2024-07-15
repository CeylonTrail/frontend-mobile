import 'package:ceylontrailapp/widgets/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_scaffold_loading.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formForgotPasswordKey = GlobalKey<FormState>();

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
                    key: _formForgotPasswordKey,
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
                                "Forgot Password?",
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
                                "To reset your password, please enter the email address connected with your account.",
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  'E-mail',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.primary_dark_3),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter E-mail',
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
