import 'package:ceylontrailapp/screen/followers_screen.dart';
import 'package:ceylontrailapp/widgets/bot_scaffold.dart';
import 'package:ceylontrailapp/widgets/follow_button.dart';
import 'package:ceylontrailapp/widgets/following_screen.dart';
import 'package:flutter/material.dart';
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
  final NewsfeedController newsFeedController = Get.put(NewsfeedController());
  final ValueNotifier<int> selectedIndex =
  ValueNotifier<int>(0); // 0: Posts, 1: Photos, 2: Trips
  final ImagePicker _picker = ImagePicker();
  String _imagePath = 'assets/images/img.png';
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return BotScaffold(
      body: CustomMyProfileAppbar(
        content: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return ColoredBox(
              color: AppTheme.colors.white,
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
                                                      imagePath: _imagePath,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                color: AppTheme.colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
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
                                                source:
                                                ImageSource.gallery);
                                            if (pickedFile != null) {
                                              setState(() {
                                                _imagePath = pickedFile.path;
                                                _showOverlay = false;
                                              });
                                            }
                                          },
                                          child: Text(
                                            'Change',
                                            style: TextStyle(
                                                color: AppTheme.colors.white),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FollowButton(),
                          FollowButton(),
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
                                              color: AppTheme.colors.primary,
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
                                              color: AppTheme.colors.primary,
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
                                    backgroundColor: selectedIndex.value == 0
                                        ? AppTheme.colors.white
                                        : AppTheme.colors.primary_dark_3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
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
                                      borderRadius:
                                      BorderRadius.circular(10.0),
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
                                      borderRadius:
                                      BorderRadius.circular(10.0),
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
                  Expanded(
                    child: IndexedStack(
                      index: value,
                      children: [
                        // Posts Tab
                        Obx(() {
                          return Column(
                            children: newsFeedController.posts.map((post) {
                              return NewsfeedPost(post: post);
                            }).toList(),
                          );
                        }),
                        // Photos Tab
                        Column(
                          children: List.generate(5, (index) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              color: AppTheme.colors.white,
                              width: double.infinity,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/$index.jpg',
                                    fit: BoxFit.fill,
                                    // errorBuilder: (context, error, stackTrace) {
                                    //   return Center(child: Text('Image not found', style: TextStyle(color: Colors.red)));
                                    // },
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        // Trips Tab
                        Column(
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
