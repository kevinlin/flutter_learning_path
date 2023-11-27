class AuthPayload {
  String email;
  String password;

  AuthPayload(
    this.email,
    this.password,
  );

  @override
  String toString() {
    return 'AuthPayload{email: $email, password: $password}';
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
