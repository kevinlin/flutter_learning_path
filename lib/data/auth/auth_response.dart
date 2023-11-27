class AuthResponse {
  String accessToken;
  User user;

  AuthResponse({
    required this.accessToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class User {
  String id;

  User({required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
    );
  }
}
