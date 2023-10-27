import 'package:flutter_andomie/core.dart';

import '../cache/auth_cache_manager.dart';
import '../model/trade_model.dart';
import '../network/dio_manager.dart';

abstract class ITradeService {
  final DioManager dioManager;
  final AuthCacheManager cacheManager;
  final ConnectivityProvider connectivity;

  ITradeService(
    this.dioManager,
    this.cacheManager,
    this.connectivity,
  );

  Future<Response<TradeModel>> getOpenTrades(String id);
}
