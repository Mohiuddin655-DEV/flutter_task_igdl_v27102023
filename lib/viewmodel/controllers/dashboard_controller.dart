import 'package:flutter/foundation.dart';
import 'package:flutter_andomie/utils.dart';
import 'package:get/get.dart' hide Response;

import '../../data/model/trade_model.dart';
import '../../repository/trade_repository.dart';
import '../../utils/dependency_injection.dart';

class DashboardController extends GetxController {
  final TradeRepository _tradeRepository = locator<TradeRepository>();

  Rx<Response<TradeModel>> tradeResponse = Response<TradeModel>().obs;

  void fetchUserTrades() {
    tradeResponse.value = Response(loading: true);
    _tradeRepository.getOpenTrades().then((value) {
      tradeResponse.value = value;
      if (kDebugMode) {
        print(value);
      }
    }).onError((error, stackTrace) {
      tradeResponse.value = tradeResponse.value.withLoaded(true);
    });
  }
}
