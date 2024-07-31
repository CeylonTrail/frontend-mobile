class SocialMediaPost {
  SocialMediaPost({
    required this.code,
    required this.message,
    required this.data,
  });

  final int? code;
  final String? message;
  final List<Datum> data;

  factory SocialMediaPost.fromJson(Map<String, dynamic> json){
    return SocialMediaPost(
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.postId,
    required this.user,
    required this.content,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? postId;
  final User? user;
  final String? content;
  final List<User> likes;
  final List<Comment> comments;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      postId: json["postId"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      content: json["content"],
      likes: json["likes"] == null ? [] : List<User>.from(json["likes"]!.map((x) => User.fromJson(x))),
      comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Comment {
  Comment({
    required this.commentId,
    required this.user,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? commentId;
  final User? user;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
      commentId: json["commentId"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      content: json["content"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class User {
  User({
    required this.userId,
    required this.username,
    required this.profilePictureUrl,
  });

  final int? userId;
  final String? username;
  final dynamic profilePictureUrl;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userId: json["userId"],
      username: json["username"],
      profilePictureUrl: json["profilePictureUrl"],
    );
  }

}
