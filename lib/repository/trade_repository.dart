import 'package:flutter_andomie/utils.dart';

import '../data/cache/auth_cache_manager.dart';
import '../data/model/trade_model.dart';
import '../data/service/trade_service.dart';

class TradeRepository {
  final TradeService service;

  TradeRepository({
    required this.service,
  });

  Future<Response<TradeModel>> getOpenTrades({
    String? id,
  }) async {
    final currentId = id ?? await AuthCacheManager.currentUid();
    if (currentId != null) {
      return service.getOpenTrades(id ?? currentId);
    } else {
      return Response<TradeModel>().withException("User not valid!");
    }
  }
}
