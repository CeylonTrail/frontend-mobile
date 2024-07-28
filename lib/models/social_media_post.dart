class SocialMediaPost {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final List<String> images;
  final int likes;
  final int comments;
  final int shares;
  final DateTime datetime;
  final String description;

  SocialMediaPost({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.images,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.datetime,
    required this.description,
  });

  factory SocialMediaPost.fromJson(Map<String, dynamic> json) {
    return SocialMediaPost(
      id: json['id'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      images: List<String>.from(json['images']),
      likes: json['likes'],
      comments: json['comments'],
      shares: json['shares'],
      datetime: DateTime.parse(json['datetime']),
      description: json['description'],
    );
  }
}
