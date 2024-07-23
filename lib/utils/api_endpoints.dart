class ApiEndPoints{
  static final String baseUrl = '';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String signUpEmail = 'authaccount/signup';
  final String signInEmail = 'authaccount/signin';
}