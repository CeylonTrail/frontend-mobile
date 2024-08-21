import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../screen/full_screen_post_view.dart';
import '../theme/app_theme.dart';
import '../models/post_model.dart';

class NewsfeedPost extends StatefulWidget {
  final Post post;

  const NewsfeedPost({
    super.key,
    required this.post,
  });

  @override
  NewsfeedPostState createState() => NewsfeedPostState();
}

class NewsfeedPostState extends State<NewsfeedPost> {
  bool _isReportButtonVisible = false;
  bool _isLiked = false;
  int _likeCount = 0;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _likeCount = widget.post.likes.length;
  }

  void _toggleReportButton() {
    setState(() {
      _isReportButtonVisible = !_isReportButtonVisible;
    });
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });
  }

  String _formatCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}M';
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  // void _openFullScreenImageViewer(int initialIndex) {
  //   Get.to(() => FullScreenImageViewer(
  //     imageUrls: widget.post.images, // Pass the actual image URLs
  //     initialIndex: initialIndex,
  //   ));
  // }

  void _openFullScreenPostView() {
    Get.to(() => FullScreenPostView(post: widget.post));
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width - 32;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.user.username,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "on ${widget.post.createdAt.year}/${widget.post.createdAt.month}/${widget.post.createdAt.day} at ${widget.post.createdAt.hour}:${widget.post.createdAt.minute}",
                        style: TextStyle(
                            color: AppTheme.colors.secondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/bx-dots-vertical-rounded.svg'),
                  onPressed: _toggleReportButton,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.post.content,
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.colors.primary_dark_3,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (widget.post.images.isNotEmpty)
              SizedBox(
                height: imageWidth,
                width: imageWidth,
                child: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      itemCount: widget.post.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // onTap: () => _openFullScreenImageViewer(index),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.post.images[index], // Use the actual image URLs
                              fit: BoxFit.cover,
                              width: imageWidth,
                              height: imageWidth,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary_dark_3.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${_currentImageIndex + 1}/${widget.post.images.length}', // Corrected the count display
                            style: TextStyle(
                              color: AppTheme.colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    icon: _isLiked
                        ? 'assets/icons/bxs-heart.svg'
                        : 'assets/icons/bx-heart-outline.svg',
                    label: _formatCount(_likeCount),
                    onPressed: _toggleLike,
                  ),
                  _buildActionButton(
                    icon: 'assets/icons/bx-comment-detail.svg',
                    label: _formatCount(widget.post.comments.length),
                    onPressed: _openFullScreenPostView,
                  ),
                  // _buildActionButton(
                  //   icon: 'assets/icons/bx-share.svg',
                  //   label: _formatCount(0),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (_isReportButtonVisible)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Report Post",
                    style: TextStyle(
                      color: AppTheme.colors.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: AppTheme.colors.primary_dark_3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
