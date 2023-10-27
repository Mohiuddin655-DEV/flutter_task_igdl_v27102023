import 'dart:io';

import '../enums/network_enums.dart';
import '../model/authorization_model.dart';
import '../model/user_model.dart';
import 'user_service_impl.dart';

class UserService extends IUserService {
  UserService(
    super.dioManager,
    super.cacheManager,
  );

  @override
  Future<UserModel> getCurrentUser(String id) async {
    final token = await cacheManager.getToken();
    var response = await dioManager.dio.post(
      NetworkEnums.fetchUser.path,
      data: AuthorizationModel(
        id: int.tryParse(id),
        token: token,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return UserModel.from(response.data);
    } else {
      return throw Exception();
    }
  }

  @override
  Future<String?> getLastFourNumbersPhone(String id) async {
    final token = await cacheManager.getToken();
    var response = await dioManager.dio.post(
      NetworkEnums.lastFourDigitsOfPhone.path,
      data: AuthorizationModel(
        id: int.tryParse(id),
        token: token,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      return throw Exception();
    }
  }
}
