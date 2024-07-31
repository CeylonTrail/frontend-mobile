import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../theme/app_theme.dart';
import '../widgets/post_image_full_screen_view.dart';

class PostPopup extends StatefulWidget {
  const PostPopup({super.key});

  @override
  PostPopupState createState() => PostPopupState();
}

class PostPopupState extends State<PostPopup> {
  late final TextEditingController _controller;
  final List<File> _photos = [];
  final ImagePicker _picker = ImagePicker();
  String _selectedPrivacyOption = 'Public'; // Default selected option

  final List<Map<String, dynamic>> _dropdownItems = [
    {'icon': Icons.public, 'text': 'Public'},
    {'icon': Icons.people, 'text': 'Followers'},
    {'icon': Icons.lock, 'text': 'Only Me'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      _photos.addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
    });
  }

  void _viewPhoto(File photo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostImageFullScreenView(photo: photo),
      ),
    );
  }

  void _removePhoto(File photo) {
    setState(() {
      _photos.remove(photo);
    });
  }

  Future<bool> _onWillPop() async {
    final shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Discard post?'),
          content: const Text('Are you sure you want to discard this post?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    return shouldDiscard ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          // User swiped from left to right (back gesture)
          // You can ignore this gesture to prevent going back
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        appBar: AppBar(
          title: Text(
            "Create a new Post",
            style: TextStyle(color: AppTheme.colors.primary_dark_3),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.colors.primary_dark_3),
            onPressed: () async {
              if (await _onWillPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.colors.primary_dark_3,
                            width: 1.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/img.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Leonardo DiCaprio',
                        style: TextStyle(
                          color: AppTheme.colors.primary_dark_3,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String postContent = _controller.text;
                      print("Post Content: $postContent");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppTheme.colors.secondary_dark_2,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                    ),
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Add a new Post...",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: _pickImages,
                      icon: SvgPicture.asset(
                        'assets/icons/gallery-photos.svg',
                        height: 24,
                        width: 24,
                      ),
                      label: const Text("Add Photos"),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppTheme.colors.secondary_dark_2,
                        foregroundColor: AppTheme.colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.secondary_light_1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: _selectedPrivacyOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPrivacyOption = newValue!;
                          });
                        },
                        items: _dropdownItems.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['text'],
                            child: Row(
                              children: <Widget>[
                                Icon(item['icon'],
                                    color: AppTheme.colors.secondary_dark),
                                const SizedBox(width: 10),
                                Text(
                                  item['text'],
                                  style: TextStyle(
                                    color: AppTheme.colors.secondary_dark,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        style: TextStyle(
                          color: AppTheme.colors.secondary_dark,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_photos.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _photos.map((photo) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () => _viewPhoto(photo),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[400]!,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.file(
                                    photo,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => _removePhoto(photo),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
