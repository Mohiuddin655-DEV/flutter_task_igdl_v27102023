import '../../res/api_info/api_info.dart';

enum NetworkEnums {
  login(ApiConstants.login),
  fetchUser(ApiConstants.fetchUser),
  lastFourDigitsOfPhone(ApiConstants.lastFourDigitsOfPhone),
  getOpenTrades(ApiConstants.getOpenTrades),
  introOff('introOff'),
  token('token');

  final String path;

  const NetworkEnums(this.path);
}
