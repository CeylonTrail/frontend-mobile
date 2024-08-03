import 'dart:convert';

class PostResponse {
  final int code;
  final String message;
  final List<Post> data;

  PostResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    var postsData = json['data'] as List? ?? [];
    List<Post> posts = postsData.map((post) => Post.fromJson(post)).toList();

    return PostResponse(
      code: json['code'] ?? 0, // Provide a default value if null
      message: json['message'] ?? '', // Provide a default value if null
      data: posts,
    );
  }
}

class Post {
  final int postId;
  final User user;
  final String content;
  final String? privacy;
  final List<User> likes;
  final List<Comment> comments;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post({
    required this.postId,
    required this.user,
    required this.content,
    this.privacy,
    required this.likes,
    required this.comments,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var likesList = json['likes'] as List? ?? [];
    List<User> likes = likesList.map((i) => User.fromJson(i)).toList();

    var commentsList = json['comments'] as List? ?? [];
    List<Comment> comments = commentsList.map((i) => Comment.fromJson(i)).toList();

    return Post(
      postId: json['postId'] ?? 0, // Provide a default value if null
      user: User.fromJson(json['user'] ?? {}), // Provide a default empty map if null
      content: json['content'] ?? '', // Provide a default value if null
      privacy: json['privacy'], // Handle if this can be null
      likes: likes,
      comments: comments,
      images: List<String>.from(json['images'] ?? []), // Provide a default empty list if null
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()), // Handle if this can be null
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()), // Handle if this can be null
    );
  }
}

class User {
  final int userId;
  final String username;
  final String? profilePictureUrl;

  User({
    required this.userId,
    required this.username,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? 0, // Provide a default value if null
      username: json['username'] ?? '', // Provide a default value if null
      profilePictureUrl: json['profilePictureUrl'], // Handle if this can be null
    );
  }
}

class Comment {
  final int commentId;
  final User user;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.commentId,
    required this.user,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'] ?? 0, // Provide a default value if null
      user: User.fromJson(json['user'] ?? {}), // Provide a default empty map if null
      content: json['content'] ?? '', // Provide a default value if null
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()), // Handle if this can be null
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()), // Handle if this can be null
    );
  }
}
