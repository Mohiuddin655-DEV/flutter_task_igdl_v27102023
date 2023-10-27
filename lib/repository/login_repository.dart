import '../data/cache/auth_cache_manager.dart';
import '../data/service/auth_service.dart';

class LoginRepository {
  final AuthService authService;
  final AuthCacheManager cacheManager;

  LoginRepository({
    required this.authService,
    required this.cacheManager,
  });

  Future<String?> loginApi({
    required String id,
    required String password,
  }) async {
    final String? token = await authService.login(
      id: id,
      password: password,
    );
    if (token != null) {
      await cacheManager.updateToken(token);
      await cacheManager.updateId(id);
      await cacheManager.updateLoggedIn(true);
      return token;
    } else {
      await cacheManager.signOut();
      return null;
    }
  }
}
