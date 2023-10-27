import '../data/cache/auth_cache_manager.dart';
import '../data/model/user_model.dart';
import '../data/service/user_service.dart';

class UserRepository {
  final UserService service;

  UserRepository({
    required this.service,
  });

  Future<UserModel> getCurrentUser({
    String? id,
  }) async {
    final currentId = id ?? await AuthCacheManager.currentUid();
    if (currentId != null) {
      return service.getCurrentUser(id ?? currentId);
    } else {
      throw Exception("User not valid!");
    }
  }

  Future<String?> getLastFourNumbersPhone({
    String? id,
  }) async {
    final currentId = id ?? await AuthCacheManager.currentUid();
    if (currentId != null) {
      return service.getLastFourNumbersPhone(id ?? currentId);
    } else {
      throw Exception("User not valid!");
    }
  }
}
