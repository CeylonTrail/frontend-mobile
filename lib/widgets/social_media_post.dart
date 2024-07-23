import 'package:ceylontrailapp/widgets/post_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/popup_route.dart';
import '../theme/app_theme.dart';

class SocialMediaPost extends StatelessWidget {
  const SocialMediaPost({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 60,
              width: size.width - 16,
              decoration: BoxDecoration(
                  color: AppTheme.colors.white,
                  border:
                      Border.all(color: AppTheme.colors.secondary, width: 2),
                  borderRadius: BorderRadius.circular(50)),

              padding: const EdgeInsets.all(8.0),
              // Add some padding if needed
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/img.png',
                        width: 42,
                        height: 42,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(SlideFromTopRoute(page: PostPopup()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right:40, bottom: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Add a new Post...",
                              hintStyle: TextStyle(
                                color: AppTheme.colors.secondary_light_3,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTheme.colors.primary_dark_3,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            enabled:
                                false, // Disable TextField to trigger GestureDetector
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

