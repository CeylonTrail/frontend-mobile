import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/sign_in_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
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
            flex: 3,
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
                    key: _formSignInKey,
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
                                "Welcome Back",
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
                                        color: AppTheme.colors.secondary_light_3,
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
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.primary_dark_3),
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: AppTheme.colors.secondary_light_2),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: AppTheme.colors.secondary_light_3,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        "Remember Me",
                                        style: TextStyle(
                                          color: AppTheme.colors.black,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: AppTheme.colors.primary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SignIn(),
                              SizedBox(height: size.height * 0.02),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Add your onPressed code here!
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/google_icon.svg',
                                  height: 24, // Adjust the size as needed
                                  width: 24,
                                ),
                                label: const Text("Sign In with Google"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppTheme.colors.secondary_light_1,
                                  foregroundColor: AppTheme.colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  elevation: 0,
                                ),
                              ),
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
