import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class NewsfeedController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://localhost:8083/api/v1/post/community-feed')); // Use your local IP address instead of localhost
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        PostResponse apiResponse = PostResponse.fromJson(jsonData);

        if (apiResponse.code == 200) { // Check the code field from the response body
          print('Posts data fetched successfully');
          posts.value = apiResponse.data;
        } else {
          print('Failed to load posts: ${apiResponse.message}');
        }
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading(false);
    }
  }
}
