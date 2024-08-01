// my_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/newsfeed_controller.dart'; // Import the controller
import '../theme/app_theme.dart';
import '../widgets/custom_my_profile_appbar.dart';
import '../widgets/profile_full_screen_image_view.dart';
import '../widgets/newsfeed_post.dart'; // Import your NewsfeedPost widget

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  final NewsfeedController newsFeedController = Get.put(NewsfeedController()); // Use NewsFeedController
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0); // 0: Posts, 1: Photos, 2: Trips

  @override
  Widget build(BuildContext context) {
    return CustomMyProfileAppbar(
      content: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return ColoredBox(
            color: AppTheme.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      selectedIndex.value = 0;
                                    },
                                    style: TextButton.styleFrom(
                                      overlayColor: Colors.transparent,
                                      backgroundColor: selectedIndex.value == 0
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
                                      child: Center(
                                        child: Text(
                                          'Posts',
                                          style: TextStyle(
                                            color: selectedIndex.value == 0
                                                ? AppTheme.colors.primary_dark_3
                                                : AppTheme.colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  TextButton(
                                    onPressed: () {
                                      selectedIndex.value = 1;
                                    },
                                    style: TextButton.styleFrom(
                                      overlayColor: Colors.transparent,
                                      backgroundColor: selectedIndex.value == 1
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
                                      child: Center(
                                        child: Text(
                                          'Photos',
                                          style: TextStyle(
                                            color: selectedIndex.value == 1
                                                ? AppTheme.colors.primary_dark_3
                                                : AppTheme.colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  TextButton(
                                    onPressed: () {
                                      selectedIndex.value = 2;
                                    },
                                    style: TextButton.styleFrom(
                                      overlayColor: Colors.transparent,
                                      backgroundColor: selectedIndex.value == 2
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
                                      child: Center(
                                        child: Text(
                                          'Trips',
                                          style: TextStyle(
                                            color: selectedIndex.value == 2
                                                ? AppTheme.colors.primary_dark_3
                                                : AppTheme.colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: AppTheme.colors.black,
                            thickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: value,
                    children: [
                      // Posts Tab
                      Obx(() {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: newsFeedController.posts.map((post) {
                              return NewsfeedPost(post: post);
                            }).toList(),
                          ),
                        );
                      }),
                      // Photos Tab
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(5, (index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              color: AppTheme.colors.primary_dark_3,
                              height: 150.0,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Photo $index',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppTheme.colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      // Trips Tab
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              color: AppTheme.colors.primary_dark_3,
                              height: 150.0,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Trip $index',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppTheme.colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
