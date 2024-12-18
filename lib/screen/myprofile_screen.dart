import 'package:ceylontrailapp/screen/followers_screen.dart';
import 'package:ceylontrailapp/widgets/bot_scaffold.dart';
import 'package:ceylontrailapp/widgets/following_screen.dart';
import 'package:ceylontrailapp/widgets/my_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/login_controller.dart';
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
  String _imagePath = 'assets/images/traveller.jpg';
  bool _showOverlay = false;
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
  Future<void> uploadProfilePicture() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
          _showOverlay = false;
        });
        // Simulate an upload or call an API here if needed.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile picture updated successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to upload image: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                              onPressed: uploadProfilePicture,
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
                              '${_firstNameController.text} ${_lastNameController.text}',
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
                                                '0',
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
                                                '0',
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
                /*rest*/
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
                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ValueListenableBuilder<int>(
                                      valueListenable: selectedIndex,
                                      builder: (context, value, child) {
                                        return Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                selectedIndex.value = 0;
                                              },
                                              style: TextButton.styleFrom(
                                                overlayColor: Colors.transparent,
                                                backgroundColor: value == 0
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
                                                      color: value == 0
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
                                                backgroundColor: value == 1
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
                                                      color: value == 1
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
                                                backgroundColor: value == 2
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
                                                      color: value == 2
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
                                        );
                                      },
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
                    height: MediaQuery.of(context).size.height,
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
                                  return MyPostWidget();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: ListView.builder(
                                itemCount: 0, // Number of dummy photos
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text('Photo #$index'),
                                    subtitle: Text('This is the description of photo #$index.'),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: ListView.builder(
                                itemCount: 0, // Number of dummy trips
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.map),
                                    title: Text('Trip #$index'),
                                    subtitle: Text('This is the summary of trip #$index.'),
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
