class LoginModel {
  final int? id;
  final String? email;
  final String? password;

  const LoginModel({
    this.id,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': id,
      'email': email,
      'password': password,
    };
  }
}
