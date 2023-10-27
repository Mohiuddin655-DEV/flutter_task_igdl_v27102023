import 'package:flutter_andomie/core.dart';

class UserModel {
  final String? address;
  final double? balance;
  final String? city;
  final String? country;
  final double? currency;
  final int? currentTradesCount;
  final double? currentTradesVolume;
  final double? equity;
  final double? freeMargin;
  final bool? isAnyOpenTrades;
  final bool? isSwapFree;
  final int? leverage;
  final String? name;
  final String? phone;
  final int? totalTradesCount;
  final double? totalTradesVolume;
  final int? type;
  final int? verificationLevel;
  final String? zipCode;

  const UserModel({
    this.address,
    this.balance,
    this.city,
    this.country,
    this.currency,
    this.currentTradesCount,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.leverage,
    this.name,
    this.phone,
    this.totalTradesCount,
    this.totalTradesVolume,
    this.type,
    this.verificationLevel,
    this.zipCode,
  });

  factory UserModel.from(Map<String, dynamic> source) {
    return UserModel(
      address: source.entityValue("address"),
      balance: source.entityValue("balance"),
      city: source.entityValue("city"),
      country: source.entityValue("country"),
      currency: source.entityValue("currency"),
      currentTradesCount: source.entityValue("currentTradesCount"),
      currentTradesVolume: source.entityValue("currentTradesVolume"),
      equity: source.entityValue("equity"),
      freeMargin: source.entityValue("freeMargin"),
      isAnyOpenTrades: source.entityValue("isAnyOpenTrades"),
      isSwapFree: source.entityValue("isSwapFree"),
      leverage: source.entityValue("leverage"),
      name: source.entityValue("name"),
      phone: source.entityValue("phone"),
      totalTradesCount: source.entityValue("totalTradesCount"),
      totalTradesVolume: source.entityValue("totalTradesVolume"),
      type: source.entityValue("type"),
      verificationLevel: source.entityValue("verificationLevel"),
      zipCode: source.entityValue("zipCode"),
    );
  }

  Map<String, dynamic> get source {
    return {
      "address": address,
      "balance": balance,
      "city": city,
      "country": country,
      "currency": currency,
      "currentTradesCount": currentTradesCount,
      "currentTradesVolume": currentTradesVolume,
      "equity": equity,
      "freeMargin": freeMargin,
      "isAnyOpenTrades": isAnyOpenTrades,
      "isSwapFree": isSwapFree,
      "leverage": leverage,
      "name": name,
      "phone": phone,
      "totalTradesCount": totalTradesCount,
      "totalTradesVolume": totalTradesVolume,
      "type": type,
      "verificationLevel": verificationLevel,
      "zipCode": zipCode,
    };
  }

  @override
  String toString() => "UserModel($source)";
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
