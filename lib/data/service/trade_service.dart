import 'dart:io';

import 'package:flutter_andomie/utils.dart';

import '../enums/network_enums.dart';
import '../model/authorization_model.dart';
import '../model/trade_model.dart';
import 'trade_service_impl.dart';

class TradeService extends ITradeService {
  TradeService(
    super.dioManager,
    super.cacheManager,
    super.connectivity,
  );

  @override
  Future<Response<TradeModel>> getOpenTrades(String id) async {
    final current = Response<TradeModel>();
    if (!(await connectivity.isConnected)) {
      return current.withStatus(Status.networkError);
    }
    final token = await cacheManager.getToken();
    var response = await dioManager.dio.post(
      NetworkEnums.getOpenTrades.path,
      data: AuthorizationModel(
        id: int.tryParse(id),
        token: token,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      final result = response.data;
      if (result is List) {
        final data = result.map((e) => TradeModel.from(e)).toList();
        return current.withResult(data);
      } else {
        return current.withStatus(Status.nullable);
      }
    } else {
      return current.withStatus(Status.notFound);
    }
  }
}
