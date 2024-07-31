import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_my_profile_appbar.dart';
import '../widgets/profile_full_screen_image_view.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  final BottomNavBarController controller = Get.put(BottomNavBarController());
  int selectedIndex = 0; // 0: Posts, 1: Photos, 2: Trips

  @override
  Widget build(BuildContext context) {
    return CustomMyProfileAppbar(
      content: Obx(() {
        return ColoredBox(
          color: AppTheme.colors.white,
          child: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileFullScreenImageView(
                                  imagePath: 'assets/images/img.png',
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'profile-image',
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.colors.primary,
                                  width: 3.0,
                                ),
                              ),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: Image.asset(
                                    'assets/images/img.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        'Change Profile Picture',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.primary_dark_3,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.colors.primary_dark_3,
                          decorationThickness: 2.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(Colors.transparent),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppTheme.colors.white,
                                      ),
                                      width: 100,
                                      height: 20,
                                      child: Text(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppTheme.colors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.colors.primary_dark_3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(Colors.transparent),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppTheme.colors.white,
                                      ),
                                      width: 100,
                                      height: 20,
                                      child: Text(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppTheme.colors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppTheme.colors.primary_dark_3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent,
                                  backgroundColor: selectedIndex == 0
                                      ? AppTheme.colors.white
                                      : AppTheme.colors.primary_dark_3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: AppTheme.colors.primary_dark_3,
                                      width: 2.3,
                                    ),
                                  ),
                                ),

                                child: SizedBox(
                                  width: 63,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Posts',
                                        style: TextStyle(
                                          color: selectedIndex == 0
                                              ? AppTheme.colors.primary_dark_3
                                              : AppTheme.colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent,
                                  backgroundColor: selectedIndex == 1
                                      ? AppTheme.colors.white
                                      : AppTheme.colors.primary_dark_3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: AppTheme.colors.primary_dark_3,
                                      width: 2.3,
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 63,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Photos',
                                        style: TextStyle(
                                          color: selectedIndex == 1
                                              ? AppTheme.colors.primary_dark_3
                                              : AppTheme.colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.transparent,
                                  backgroundColor: selectedIndex == 2
                                      ? AppTheme.colors.white
                                      : AppTheme.colors.primary_dark_3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: AppTheme.colors.primary_dark_3,
                                      width: 2.3,
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 63,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Trips',
                                        style: TextStyle(
                                          color: selectedIndex == 2
                                              ? AppTheme.colors.primary_dark_3
                                              : AppTheme.colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppTheme.colors.black,
                        thickness: 2,
                      ),
                    ),
                    if (selectedIndex == 0)
                      Column(
                        children: List.generate(10, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            color: AppTheme.colors.primary,
                            child: Text('Post $index'),
                          );
                        }),
                      ),
                    if (selectedIndex == 1)
                      Column(
                        children: List.generate(10, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            color: AppTheme.colors.primary,
                            child: Text('Photo $index'),
                          );
                        }),
                      ),
                    if (selectedIndex == 2)
                      Column(
                        children: List.generate(10, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            color: AppTheme.colors.primary,
                            child: Text('Trip $index'),
                          );
                        }),
                      ),
                  ],
                ),
              ),
              // Add other screens here
            ],
          ),
        );
      }),
    );
  }
}