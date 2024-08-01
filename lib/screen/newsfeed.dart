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
                children: [
                  const AddNewPost(),
                  ListView.builder(
                    shrinkWrap: true, // Use shrinkWrap to make it fit inside SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: newsfeedController.posts.length,
                    itemBuilder: (context, index) {
                      final post = newsfeedController.posts[index];
                      return NewsfeedPost(post: post);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
