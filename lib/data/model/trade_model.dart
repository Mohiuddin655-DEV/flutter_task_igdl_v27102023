import 'package:flutter_andomie/core.dart';

/*
{
		"currentPrice": 1793.4,
		"comment": null,
		"digits": 2,
		"login": 2088888,
		"openPrice": 4732.58,
		"openTime": "2021-11-08T06:35:33",
		"profit": -29.4,
		"sl": 0.0,
		"swaps": 0.0,
		"symbol": "#Ethereum",
		"tp": 0.0,
		"ticket": 1386773321,
		"type": 0,
		"volume": 0.01
	}
*/
class TradeModel {
  final double? currentPrice;
  final String? comment;
  final int? digits;
  final int? login;
  final double? openPrice;
  final String? openTime;
  final double? profit;
  final double? sl;
  final double? swaps;
  final String? symbol;
  final double? tp;
  final int? ticket;
  final int? type;
  final double? volume;

  const TradeModel({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory TradeModel.from(Map<String, dynamic> source) {
    return TradeModel(
      currentPrice: source.entityValue("currentPrice"),
      comment: source.entityValue("comment"),
      digits: source.entityValue("digits"),
      login: source.entityValue("login"),
      openPrice: source.entityValue("openPrice"),
      openTime: source.entityValue("openTime"),
      profit: source.entityValue("profit"),
      sl: source.entityValue("sl"),
      swaps: source.entityValue("swaps"),
      symbol: source.entityValue("symbol"),
      tp: source.entityValue("tp"),
      ticket: source.entityValue("ticket"),
      type: source.entityValue("type"),
      volume: source.entityValue("volume"),
    );
  }

  Map<String, dynamic> get source {
    return {
      "currentPrice": currentPrice,
      "comment": comment,
      "digits": digits,
      "login": login,
      "openPrice": openPrice,
      "openTime": openTime,
      "profit": profit,
      "sl": sl,
      "swaps": swaps,
      "symbol": symbol,
      "tp": tp,
      "ticket": ticket,
      "type": type,
      "volume": volume,
    };
  }

  @override
  String toString() => "TradeModel($source)";
}
/*

{
	"address": "Мусы Джалиля д.32 кор.1 кв.77",
	"balance": 314.79,
	"city": "Калининград",
	"country": "Belarus",
	"currency": 0,
	"currentTradesCount": 4,
	"currentTradesVolume": 0.04,
	"equity": 236.98999999999995,
	"freeMargin": 69.34483999999995,
	"isAnyOpenTrades": true,
	"isSwapFree": false,
	"leverage": 1,
	"name": "Tester",
	"phone": "4abb3f0b138407cd3d0f00443abad73d",
	"totalTradesCount": 1636,
	"totalTradesVolume": 76.15,
	"type": 1,
	"verificationLevel": 1,
	"zipCode": "ru236022"
}

 */
