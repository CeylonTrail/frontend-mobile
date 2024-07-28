import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/social_media_post.dart';

class NewsfeedController extends GetxController {
  var posts = <SocialMediaPost>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    const url = 'https://dummyjson.com/c/a39c-6551-4027-bf44'; // Replace with your backend API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        var fetchedPosts = data.map((json) => SocialMediaPost.fromJson(json)).toList();
        posts.assignAll(fetchedPosts);
        isLoading.value = false;
        print('Post Loading Successful');
      } else {
        // Handle error
        print('Failed to load posts');
        isLoading.value = false;
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
      isLoading.value = false;
    }
  }
}
