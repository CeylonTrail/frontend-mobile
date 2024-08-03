class UserData {
  final String accessToken;
  final int userId;
  final String username;
  final String email;
  final String firstname;
  final String lastname;
  final bool accountState;
  final String role;
  final String? profilePictureUrl;

  UserData({
    required this.accessToken,
    required this.userId,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.accountState,
    required this.role,
    this.profilePictureUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      accessToken: json['accessToken'],
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      accountState: json['accountState'],
      role: json['role'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'userId': userId,
      'username': username,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'accountState': accountState,
      'role': role,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
