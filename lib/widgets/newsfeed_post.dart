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
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "${widget.date.day}/${widget.date.month}/${widget.date.year} at ${widget.date.hour}:${widget.date.minute}",
                      style: TextStyle(
                          color: AppTheme.colors.secondary, fontSize: 12),
                    ),
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset(
                      'assets/icons/bx-dots-horizontal-rounded.svg'),
                  onPressed: _toggleReportButton,
                ),
              ],
            ),
            // const SizedBox(height: 5),
            Text(widget.postText),
            // const SizedBox(height: 5),
            if (widget.imageUrls.isNotEmpty)
              GestureDetector(
                onTap: () => _showAllImages(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Image.network(
                            widget.imageUrls[0],
                            fit: BoxFit.cover,
                            width: imageWidth,
                            height: imageWidth,
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      if (widget.imageUrls.length > 1)
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
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
                                    color: Colors.black.withOpacity(0.5),
                                    child: Center(
                                      child: Text(
                                        '+${widget.imageUrls.length - 2}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
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
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          _isLiked
                              ? 'assets/icons/bxs-heart.svg'
                              : 'assets/icons/bx-heart-outline.svg',
                        ),
                        onPressed: _toggleLike,
                      ),
                      Text(
                        '${_formatCount(_likeCount)} Likes',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/icons/bx-comment-detail.svg'),
                      ),
                      Text(
                        '${_formatCount(widget.comments)} Comments',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/bx-share.svg'),
                      ),
                      Text(
                        '${_formatCount(widget.shares)} Shares',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
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
}

class ImageScrollView extends StatelessWidget {
  final List<String> imageUrls;

  const ImageScrollView({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
