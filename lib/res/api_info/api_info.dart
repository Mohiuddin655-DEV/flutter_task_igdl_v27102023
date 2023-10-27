class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = "https://peanut.ifxdb.com/api/ClientCabinetBasic";

  static const String login = "$baseUrl/IsAccountCredentialsCorrect";
  static const String fetchUser = "$baseUrl/GetAccountInformation";
  static const String lastFourDigitsOfPhone = "$baseUrl/GetLastFourNumbersPhone";
  static const String getOpenTrades = "$baseUrl/GetOpenTrades";
}
