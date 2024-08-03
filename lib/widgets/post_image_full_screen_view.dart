import 'package:flutter/material.dart';
import 'dart:io';
import '../theme/app_theme.dart';

class PostImageFullScreenView extends StatelessWidget {
  final File photo;

  const PostImageFullScreenView({super.key, required this.photo});

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
            color: AppTheme.colors.primary
          ),
        ),
      ),
      body: Center(
        child: Image.file(photo),
      ),
    );
  }
}
