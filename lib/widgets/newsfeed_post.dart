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

  void _showAllImages(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScrollView(imageUrls: widget.imageUrls),
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      double result = count / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = (MediaQuery.of(context).size.width - 40) / 2;
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
                      const SizedBox(height: 4),
                      Text(
                        "on ${widget.date.day}/${widget.date.month}/${widget.date.year} at ${widget.date.hour}:${widget.date.minute}",
                        style: TextStyle(
                            color: AppTheme.colors.secondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/bx-dots-horizontal-rounded.svg'),
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
                  color: AppTheme.colors.black,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (widget.imageUrls.isNotEmpty)
              GestureDetector(
                onTap: () => _showAllImages(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.imageUrls[0],
                            fit: BoxFit.cover,
                            width: imageWidth,
                            height: imageWidth,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (widget.imageUrls.length > 1)
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.imageUrls[1],
                                  fit: BoxFit.cover,
                                  width: imageWidth,
                                  height: imageWidth,
                                ),
                              ),
                              if (widget.imageUrls.length > 2)
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.colors.black
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+${widget.imageUrls.length - 2}',
                                        style: TextStyle(
                                          color: AppTheme.colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
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
                    label: '${_formatCount(_likeCount)} Likes',
                    onPressed: _toggleLike,
                  ),
                  _buildActionButton(
                    icon: 'assets/icons/bx-comment-detail.svg',
                    label: '${_formatCount(widget.comments)} Comments',
                    onPressed: () {},
                  ),
                  _buildActionButton(
                    icon: 'assets/icons/bx-share.svg',
                    label: '${_formatCount(widget.shares)} Shares',
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
                  child: const Text('Report'),
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
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppTheme.colors.secondary_light_1,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(icon),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ImageScrollView extends StatelessWidget {
  final List<String> imageUrls;

  const ImageScrollView({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(
                    imageUrl: imageUrls[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(imageUrls[index]),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.network(imageUrl),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
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
