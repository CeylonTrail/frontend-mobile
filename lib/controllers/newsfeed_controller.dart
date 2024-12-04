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
      var response = await http.get(Uri.parse('http://10.22.162.199:8083/api/v1/post/community-feed/public')); // Use your local IP address instead of localhost
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

      Future<void> addComment(int postId, String content) async {
        final url = 'http://192.168.1.2:8083/api/v1/comment'; // Adjust the endpoint URL
        final headers = {'Content-Type': 'application/json'};
        final body = jsonEncode({
          'content': content,
        });

        try {
          final response = await http.post(Uri.parse(url), headers: headers, body: body);
          if (response.statusCode == 200) {
            print('Comment added successfully');
            // Optionally, update the local state or fetch posts again
          } else {
            print('Failed to add comment: ${response.statusCode}');
          }
        } catch (e) {
          print('Error adding comment: $e');
        }
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading(false);
    }
  }
}
