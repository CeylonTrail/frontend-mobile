import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

class MyPostWidget extends StatefulWidget {
  const MyPostWidget({super.key});

  @override
  MyPostWidgetState createState() => MyPostWidgetState();
}

class MyPostWidgetState extends State<MyPostWidget> {
  List<dynamic> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  // Method to retrieve token from FlutterSecureStorage
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _fetchProfile() async {
    try {
      // Retrieve JWT token from FlutterSecureStorage
      final String? token = await getToken();

      if (token == null) {
        print("Token missing");
        throw Exception('Token is missing');
      }

      // API call to fetch profile
      final response = await http.get(
        Uri.parse('http://10.22.162.199:8083/api/v1/user/profile'),
        headers: {
          'Authorization': 'Bearer $token', // Add token to the Authorization header
        },
      );

      print("Response code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['data']['posts']; // Extract posts data
          _isLoading = false;
        });
      } else {
        print('Error: ${response.reasonPhrase}');
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}B'; // Changed M to B for Billion
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Posts'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _posts.isEmpty
          ? const Center(child: Text('No posts available'))
          : ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          final images = post['images'] as List<dynamic>;
          final imageUrls = images.map((e) => e.toString()).toList();

          return _buildPostCard(
            username: post['user']['username'],
            content: post['content'],
            createdAt: post['createdAt'],
            likeCount: post['likeCount'],
            commentCount: post['commentCount'],
            images: imageUrls,
          );
        },
      ),
    );
  }

  Widget _buildPostCard({
    required String username,
    required String content,
    required String createdAt,
    required int likeCount,
    required int commentCount,
    required List<String> images,
  }) {
    bool _isLiked = false;

    void _toggleLike() {
      setState(() {
        _isLiked = !_isLiked;
      });
    }

    return Card(
      color: AppTheme.colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User details and timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      createdAt.split('T')[0], // Display only the date
                      style: TextStyle(
                        color: AppTheme.colors.secondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/bx-dots-vertical-rounded.svg'),
                  onPressed: () {
                    // Handle options
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Post content
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.colors.primary_dark_3,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            // Images
            if (images.isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            // Like and comment buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: _toggleLike,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        _isLiked
                            ? 'assets/icons/bxs-heart.svg'
                            : 'assets/icons/bx-heart-outline.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatCount(likeCount),
                        style: TextStyle(
                          color: AppTheme.colors.primary_dark_3,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle comments
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/bx-comment-detail.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatCount(commentCount),
                        style: TextStyle(
                          color: AppTheme.colors.primary_dark_3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
