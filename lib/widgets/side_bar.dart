import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../screen/home_screen.dart';
import '../screen/myprofile_screen.dart';
import '../screen/sign_in_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_my_profile_appbar.dart';
import '../widgets/info_card.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  void _closeSideBar() {
    Navigator.of(context).pop();
  }
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Retrieve logged-in user details using GetX
    final loginController = Get.find<LoginController>();

    // Initialize the controllers with logged-in user data
    _firstNameController.text = loginController.firstname.value;
    _lastNameController.text = loginController.lastname.value;

  }

  void _navigateToProfile() {
    _closeSideBar();
    print('Navigating to MyProfileScreen');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyProfileScreen()),
    );
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
                    child:  SizedBox(
                      child: InfoCard(
                        imagePath: 'assets/images/traveller.jpg',
                        name: '${_firstNameController.text} ${_lastNameController.text}',
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
                    leading: GestureDetector(
                      onTap: _navigateToProfile,
                      child: SizedBox(
                        height: 48,
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const MyProfileScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-user-circle.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: GestureDetector(
                      // onTap: ,
                      child: SizedBox(
                        height: double.infinity,
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-home.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Add similar handlers for other ListTile items
                  ListTile(
                    leading: GestureDetector(
                      child: SizedBox(
                        height: double.infinity,
                        width: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-store-alt.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                const SizedBox(width: 9.5),
                                Text(
                                  "Marketplace",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Continue similarly for other ListTile items
                  // ...
                  ListTile(
                    leading: GestureDetector(
                      child: SizedBox(
                        height: double.infinity,
                        width: 230,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _closeSideBar();
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyServicesScreen()));
                                  },
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-phone.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Emergency Services",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                    leading: GestureDetector(
                      child: SizedBox(
                        height: double.infinity,
                        width: 230,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _closeSideBar();
                               Get.to(()=> const SignInScreen());
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/bx-log-out-circle.svg',
                                width: 28,
                                height: 28,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
