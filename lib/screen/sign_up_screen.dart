import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:ceylontrailapp/widgets/user_sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

import '../widgets/sign_up_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignUpKey = GlobalKey<FormState>();
  bool rememberPassword = true;

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
            flex: 1000,
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
                    key: _formSignUpKey,
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
                                "Get Started",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.colors.primary,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  'First Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.primary_dark_3),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter First Name',
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
                                  'Last Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.primary_dark_3),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textAlign: TextAlign.start,
                                  'Create a Password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.primary_dark_3),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter a new Password',
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
                                  hintText: 'Confirm Password',
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
                              SizedBox(height: size.height * 0.01),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: rememberPassword,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberPassword = value!;
                                          });
                                        },
                                        activeColor: AppTheme.colors.primary,
                                      ),
                                      Text(
                                        "I agree to the ",
                                        style: TextStyle(
                                          color: AppTheme.colors.black,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "terms and conditions",
                                      style: TextStyle(
                                        color: AppTheme.colors.primary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const UserSignUpButton(),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Already have an account? ",
                                        style: TextStyle(
                                          color: AppTheme.colors.black,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "sign in",
                                      style: TextStyle(
                                        color: AppTheme.colors.primary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height * 0.03),
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
