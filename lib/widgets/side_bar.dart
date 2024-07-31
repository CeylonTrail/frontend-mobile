import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:ceylontrailapp/screen/myprofile_screen.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:ceylontrailapp/widgets/popular_destinations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'custom_my_profile_appbar.dart';
import 'info_card.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  void _closeSideBar() {
    Navigator.of(context).pop();
  }

  void _navigateToProfile() {
    _closeSideBar();
    Get.to(() => const MyProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          _closeSideBar();
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppTheme.colors.primary_dark_3,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _navigateToProfile,
                    child: const SizedBox(
                      child: InfoCard(
                        imagePath: 'assets/images/img.png',
                        name: 'Leonardo DiCaprio',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: 48,
                      width: 200,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _closeSideBar();
                              Get.to(() => const MyProfileScreen());
                            },
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/bx-user-circle.svg',
                                      width: 28,
                                      height: 28,
                                    )),
                                const SizedBox(width: 10),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    Get.to(() => const HomeScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-home.svg',
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add similar handlers for other ListTile items
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    // Get.to(() => const SearchScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-search.svg',
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(width: 9.5),
                              Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Continue similarly for other ListTile items
                  // ...
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 230,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    // Get.to(() => const EmergencyServicesScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-phone.svg',
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                "Emergency Services",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 230,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    // Get.offAll(() => const LoginScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-log-out-circle.svg',
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
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
    );
  }
}
