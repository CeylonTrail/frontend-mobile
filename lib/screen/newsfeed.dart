import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AddNewPost(),
                ...newsfeedController.posts.map((post) => NewsfeedPost(
                  username: '${post.firstname} ${post.lastname}',
                  date: post.datetime,
                  postText: post.description,
                  imageUrls: post.images,
                  likes: post.likes,
                  comments: post.comments,
                  shares: post.shares,
                )),
              ],
            ),
          );
        }
      }),
    );
  }
}
