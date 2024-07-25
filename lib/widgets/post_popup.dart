import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../theme/app_theme.dart';

class PostPopup extends StatefulWidget {
  const PostPopup({super.key});

  @override
  PostPopupState createState() => PostPopupState();
}

class PostPopupState extends State<PostPopup> {
  late final TextEditingController
      _controller; // Step 1: Declare the Controller
  final List<File> _photos = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Step 2: Initialize the Controller
  }

  @override
  void dispose() {
    _controller.dispose(); // Step 4: Dispose the Controller
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _photos.add(File(pickedFile.path));
      });
    }
  }

  void _viewPhoto(File photo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenImage(photo: photo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Post",
          style: TextStyle(color: AppTheme.colors.white),
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/bx-arrow-back.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.colors.primary, AppTheme.colors.primary_dark_3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller, // Step 3: Assign the Controller
                decoration: InputDecoration(
                  hintText: "Add a new Post...",
                  hintStyle: TextStyle(
                    color: AppTheme.colors.secondary_light_3,
                  ),
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo_library),
              label: const Text("Add Photo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.colors.primary, // Background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (_photos.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _photos.map((photo) {
                    return GestureDetector(
                      onTap: () => _viewPhoto(photo),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            photo,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle post submission
                String postContent =
                    _controller.text; // Access text input from the controller
                print(
                    "Post Content: $postContent"); // Example of using the input
              },
              child: const Text("Post"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.colors.primary, // Background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final File photo;

  const FullScreenImage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.colors.primary, AppTheme.colors.primary_dark_3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Image.file(photo),
      ),
    );
  }
}
