import '../cache/auth_cache_manager.dart';
import '../model/user_model.dart';
import '../network/dio_manager.dart';

abstract class IUserService {
  final DioManager dioManager;
  final AuthCacheManager cacheManager;

  IUserService(
    this.dioManager,
    this.cacheManager,
  );

  Future<UserModel> getCurrentUser(String id);

  Future<String?> getLastFourNumbersPhone(String id);
}
