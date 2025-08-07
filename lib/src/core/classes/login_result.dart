class LoginResult {
  final String? token;
  final String? error;

  LoginResult({this.token, this.error});

  bool get isSuccess => token != null;
}
