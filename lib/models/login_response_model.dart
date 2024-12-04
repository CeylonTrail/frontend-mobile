class LoginResponse {
  final int code;
  final String message;
  final Data data;

  LoginResponse({required this.code, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String accessToken;
  final String role;
  final int userId;
  final String username;
  final String email;
  final String firstname;
  final String lastname;
  final bool accountState;
  final String? profilePictureUrl;

  Data({
    required this.accessToken,
    required this.role,
    required this.userId,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.accountState,
    this.profilePictureUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'],
      role: json['role'],
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      accountState: json['accountState'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }
}
