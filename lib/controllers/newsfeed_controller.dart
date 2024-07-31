import 'package:get/get.dart';
import '../models/newsfeed_post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsfeedController extends GetxController {
  var posts = <Datum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('http://localhost:8083/api/v1/post'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var socialMediaPost = SocialMediaPost.fromJson(jsonResponse);
        posts.value = socialMediaPost.data;
      } else {
        // Handle the error
        Get.snackbar('Error', 'Failed to load posts');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
