import 'package:get/get.dart';

import '../../data/model/user_model.dart';
import '../../repository/user_repository.dart';
import '../../utils/dependency_injection.dart';

class ProfileController extends GetxController {
  final UserRepository _repository = locator<UserRepository>();
  var user = const UserModel().obs;
  RxString lastFourDigitsOfPhone = "Loading...".obs;

  void fetchUser() {
    _repository.getCurrentUser().then((value) {
      user.value = value;
    });
  }

  void fetchUserLastDigitsOfPhone() {
    _repository.getLastFourNumbersPhone().then((value) {
      lastFourDigitsOfPhone.value = value ?? "";
    });
  }
}
