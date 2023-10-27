import 'dart:io';

import '../enums/network_enums.dart';
import '../model/auth_model.dart';
import '../model/login_model.dart';
import 'auth_service_impl.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({
    required String id,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data: LoginModel(
        id: int.tryParse(id),
        email: id,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data).token;
    } else {
      return throw Exception();
    }
  }
}
