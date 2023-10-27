import 'dart:async';

import 'package:get/get.dart';

import '../../data/cache/auth_cache_manager.dart';
import '../../data/service/auth_service.dart';
import '../../data/service/auth_service_impl.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/dependency_injection.dart';

class SplashServices {
  final IAuthService authService = locator<AuthService>();
  final AuthCacheManager cacheManager = locator<AuthCacheManager>();

  void init() {
    Timer(const Duration(seconds: 3), () async {
      try {
        if (await cacheManager.isLoggedIn()) {
          await cacheManager.updateTokenFromStorage();
          Get.toNamed(RouteName.dashboard);
        } else {
          Get.toNamed(RouteName.login);
        }
      } catch (e) {
        Get.toNamed(RouteName.login);
      }
    });
  }
}
