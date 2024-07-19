import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  const SizedBox(
                    child: InfoCard(
                      imagePath: 'assets/images/img.png',
                      name: 'Leonardo DiCaprio',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                      height: 48,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-user-circle.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Profile",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-home.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-search.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 9.5,
                              ),
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-message-rounded.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Chat",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-bell.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Notifications",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-heart.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Favorite Places",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-news.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "News Feed",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-store-alt.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Marketplace",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-user-voice.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Voice Assistant",
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
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      width: 230,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-phone.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
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
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/bx-log-out-circle.svg',
                                    // color: AppTheme.colors.white,
                                    width: 28,
                                    height: 28,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
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
