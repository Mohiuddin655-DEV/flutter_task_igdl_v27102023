import 'package:get/get.dart';

import '../../view/dashboard/dashboard.dart';
import '../../view/login/login_view.dart';
import '../../view/profile/profile.dart';
import '../../view/splash/splash_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static routes() => [
        GetPage(
          name: RouteName.splash,
          page: () => const SplashView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.login,
          page: () => const LoginView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.dashboard,
          page: () => const DashboardView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.profile,
          page: () => const ProfileView(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
