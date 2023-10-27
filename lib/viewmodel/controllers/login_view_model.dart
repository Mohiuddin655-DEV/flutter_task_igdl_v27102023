import 'package:flutter_androssy/widgets.dart';
import 'package:get/get.dart';

import '../../repository/login_repository.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/dependency_injection.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController {
  final _repository = locator<LoginRepository>();

  final etUsername = EditTextController().obs;
  final etPassword = EditTextController().obs;

  RxBool loading = false.obs;

  void login() {
    loading.value = true;
    final id = etUsername.value.text;
    final password = etPassword.value.text;
    _repository.loginApi(id: id, password: password).then((value) {
      loading.value = false;
      Utils.snackBar("Login", "Login successful!");
      Get.toNamed(RouteName.dashboard);
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
