import 'package:ceylontrailapp/screen/followers_screen.dart';
import 'package:ceylontrailapp/widgets/bot_scaffold.dart';
import 'package:ceylontrailapp/widgets/follow_button.dart';
import 'package:ceylontrailapp/widgets/following_screen.dart';
import 'package:ceylontrailapp/widgets/three_dot_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/newsfeed_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_my_profile_appbar.dart';
import '../widgets/profile_full_screen_image_view.dart';
import '../widgets/newsfeed_post.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({super.key});

  @override
  OtherProfileScreenState createState() => OtherProfileScreenState();
}

class OtherProfileScreenState extends State<OtherProfileScreen> {
  final ValueNotifier<int> selectedIndex =
  ValueNotifier<int>(0); // 0: Posts, 1: Photos, 2: Trips
  final ImagePicker _picker = ImagePicker();
  String _imagePath = 'assets/images/img.png';
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return BotScaffold(
      body: CustomMyProfileAppbar(
        showMoreButton: false,
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
                                        child: GestureDetector(
                                          onTap:(){
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FollowButton(),
                              ThreeDotMenu()
                            ],
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
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverPersistentHeaderDelegate(
                    child: Container(
                      color: AppTheme.colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 1),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        selectedIndex.value = 0;
                                      },
                                      style: TextButton.styleFrom(
                                        overlayColor: Colors.transparent,
                                        backgroundColor: selectedIndex.value ==
                                            0
                                            ? AppTheme.colors.white
                                            : AppTheme.colors.primary_dark_3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color:
                                            AppTheme.colors.primary_dark_3,
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
                                                  ? AppTheme
                                                  .colors.primary_dark_3
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
                                        backgroundColor: selectedIndex.value ==
                                            1
                                            ? AppTheme.colors.white
                                            : AppTheme.colors.primary_dark_3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color:
                                            AppTheme.colors.primary_dark_3,
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
                                                  ? AppTheme
                                                  .colors.primary_dark_3
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
                                        backgroundColor: selectedIndex.value ==
                                            2
                                            ? AppTheme.colors.white
                                            : AppTheme.colors.primary_dark_3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          side: BorderSide(
                                            color:
                                            AppTheme.colors.primary_dark_3,
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
                                                  ? AppTheme
                                                  .colors.primary_dark_3
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
                              color: AppTheme.colors.primary_dark_3,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: ValueListenableBuilder<int>(
                      valueListenable: selectedIndex,
                      builder: (context, value, child) {
                        return IndexedStack(
                          index: value,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: ListView.builder(
                                itemCount: 10, // Number of dummy posts
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Post #$index'),
                                    subtitle: Text(
                                        'This is the content of post #$index.'),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: ListView.builder(
                                itemCount: 10, // Number of dummy photos
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text('Photo #$index'),
                                    subtitle: Text(
                                        'This is the description of photo #$index.'),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: ListView.builder(
                                itemCount: 10, // Number of dummy trips
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.map),
                                    title: Text('Trip #$index'),
                                    subtitle: Text(
                                        'This is the summary of trip #$index.'),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
