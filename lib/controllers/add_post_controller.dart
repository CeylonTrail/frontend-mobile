import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddPostController {
  final String apiUrl = 'http://10.22.162.199:8083/api/v1/post'; // Replace with your API endpoint

  // Retrieve the token from SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> createPost({
    required String content,
    required String tripId,
    required String privacy,
    required List<File> images,
  }) async {
    try {
      // Get token
      final String? token = await getToken();
      if (token == null) {
        print("Token is missing");
        throw Exception('Token is missing');
      }

      // Prepare images as multipart
      List<http.MultipartFile> imageFiles = [];
      for (File image in images) {
        imageFiles.add(await http.MultipartFile.fromPath(
          'images',
          image.path,
        ));
      }

      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['content'] = content
        ..fields['tripId'] = '0'
        ..fields['privacy'] = 'PUBLIC'
        ..files.addAll(imageFiles)
        ..headers.addAll({
          'Authorization': 'Bearer $token', // Include token in headers
          'Content-Type': 'multipart/form-data',
        });

      // Send request
      var response = await request.send();

      // Log the response code
      print('Response Code of adding a post: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Post created successfully!');
      } else {
        print('Failed to create post. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error while creating post: $e');
    }
  }
}
