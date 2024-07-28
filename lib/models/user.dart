class User {
  User({
    required this.login,
    required this.token,
  });

  late final String login;
  late final String token;

  User.fromJson(Map<String, dynamic> json){
    login = json['login'] ?? '';
    token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['token'] = token;
    return data;
  }
}
