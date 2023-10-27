class AuthorizationModel {
  final int? id;
  final String? token;

  const AuthorizationModel({
    this.id,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': id,
      'token': token,
    };
  }
}
