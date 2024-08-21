import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/post_model.dart';
import '../controllers/newsfeed_controller.dart';
import '../theme/app_theme.dart';

class FullScreenPostView extends StatefulWidget {
  final Post post;

  const FullScreenPostView({super.key, required this.post});

  @override
  _FullScreenPostViewState createState() => _FullScreenPostViewState();
}

class _FullScreenPostViewState extends State<FullScreenPostView> {
  final TextEditingController _commentController = TextEditingController();
  final NewsfeedController _controller = Get.find<NewsfeedController>();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      // Add the comment to the post (mockup)
      setState(() {
        widget.post.comments.add(
          Comment(
            commentId: widget.post.comments.length + 1,
            user: User(userId: 1, username: 'Current User'), // Replace with actual user data
            content: _commentController.text,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: AppTheme.colors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.post.content),
                  ),
                  // Display images if any
                  if (widget.post.images.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: widget.post.images.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.post.images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  // Comments section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Comments',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...widget.post.comments.map((comment) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Text(comment.user.username[0]),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.user.username,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(comment.content),
                                      Text(
                                        '${comment.createdAt.hour}:${comment.createdAt.minute}',
                                        style: TextStyle(
                                          color: AppTheme.colors.secondary,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Comment input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
