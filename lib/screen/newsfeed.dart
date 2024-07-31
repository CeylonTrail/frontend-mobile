import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../widgets/newsfeed_post.dart';
import '../controllers/newsfeed_controller.dart';
import '../widgets/add_new_post.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsfeedController newsfeedController = Get.put(NewsfeedController());
    return Scaffold(
      body: Obx(() {
        if (newsfeedController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            color: AppTheme.colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AddNewPost(),
                  ...newsfeedController.posts.map((post) => NewsfeedPost(
                    username: post.user?.username ?? '',
                    date: post.createdAt ?? DateTime.now(),  // Use createdAt directly
                    postText: post.content ?? '',
                    imageUrls: const [],  // Update this if your post contains images
                    likes: post.likes.length,
                    comments: post.comments.length,
                    shares: 0,  // Update this if your post contains shares data
                  )),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
