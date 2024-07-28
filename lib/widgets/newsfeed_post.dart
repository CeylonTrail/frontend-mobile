import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class NewsfeedPost extends StatefulWidget {
  final String username;
  final DateTime date;
  final String postText;
  final List<String> imageUrls;
  final int likes;
  final int comments;
  final int shares;

  const NewsfeedPost({
    super.key,
    required this.username,
    required this.date,
    required this.postText,
    required this.imageUrls,
    required this.likes,
    required this.comments,
    required this.shares,
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
    _likeCount = widget.likes;
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

  void _openFullScreenImageViewer(int initialIndex) {
    Get.to(() => FullScreenImageViewer(
      imageUrls: widget.imageUrls,
      initialIndex: initialIndex,
    ));
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
                        widget.username,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "on ${widget.date.year}/${widget.date.month}/${widget.date.day} at ${widget.date.hour}:${widget.date.minute}",
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
                widget.postText,
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.colors.primary_dark_3,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (widget.imageUrls.isNotEmpty)
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
                      itemCount: widget.imageUrls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _openFullScreenImageViewer(index),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.imageUrls[index],
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
                            '${_currentImageIndex + 1}/${widget.imageUrls.length}',
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    label: _formatCount(widget.comments),
                    onPressed: () {},
                  ),
                  _buildActionButton(
                    icon: 'assets/icons/bx-share.svg',
                    label: _formatCount(widget.shares),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            if (_isReportButtonVisible)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // Add report functionality here
                  },
                  child: Text(
                    'Report',
                    style: TextStyle(
                      color: AppTheme.colors.primary_dark_3,
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

class FullScreenImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const FullScreenImageViewer({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  FullScreenImageViewerState createState() => FullScreenImageViewerState();
}

class FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imageUrls.length,
            controller: PageController(initialPage: _currentIndex),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/bx-arrow-white.svg'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
