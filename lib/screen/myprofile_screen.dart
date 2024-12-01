import 'package:ceylontrailapp/screen/followers_screen.dart';
import 'package:ceylontrailapp/widgets/bot_scaffold.dart';
import 'package:ceylontrailapp/widgets/following_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/newsfeed_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_my_profile_appbar.dart';
import '../widgets/profile_full_screen_image_view.dart';
import '../widgets/newsfeed_post.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0); // 0: Posts, 1: Photos, 2: Trips
  final ImagePicker _picker = ImagePicker();
  String _imagePath = 'assets/images/img.png';
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return BotScaffold(
      body: CustomMyProfileAppbar(
        showMoreButton: true,
        content: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showOverlay = !_showOverlay;
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Hero(
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
                                              _imagePath,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_showOverlay)
                                      Container(
                                        width: 180,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppTheme.colors.primary_dark_3
                                              .withOpacity(0.6),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProfileFullScreenImageView(
                                                            imagePath:
                                                            _imagePath),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'View',
                                                style: TextStyle(
                                                    color:
                                                    AppTheme.colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12.0),
                                              child: Divider(
                                                color: AppTheme.colors.white,
                                                thickness: 1,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                final pickedFile =
                                                await _picker.pickImage(
                                                    source: ImageSource
                                                        .gallery);
                                                if (pickedFile != null) {
                                                  setState(() {
                                                    _imagePath =
                                                        pickedFile.path;
                                                    _showOverlay = false;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                'Change',
                                                style: TextStyle(
                                                    color:
                                                    AppTheme.colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Leonardo DiCaprio',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.colors.primary_dark_3,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                decorationColor: AppTheme.colors.primary_dark_3,
                                decorationThickness: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.to(const FollowersScreen());
                                      },
                                      style: ButtonStyle(
                                        overlayColor: WidgetStateProperty.all(
                                            Colors.transparent),
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
                                                  color:
                                                  AppTheme.colors.primary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: AppTheme
                                                    .colors.primary_dark_3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(const FollowingScreen());
                                      },
                                      style: ButtonStyle(
                                        overlayColor: WidgetStateProperty.all(
                                            Colors.transparent),
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
                                                  color:
                                                  AppTheme.colors.primary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Following',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: AppTheme
                                                    .colors.primary_dark_3,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverPersistentHeaderDelegate({required this.child});

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 100;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
