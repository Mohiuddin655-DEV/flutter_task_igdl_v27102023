import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../exception/api_exception.dart';
import 'base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  void _print(var value) {
    if (kDebugMode) {
      print(value);
    }
  }

  @override
  Future<dynamic> getApi(String url) async {
    _print(url);
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      return response.modify;
    } on SocketException {
      throw const InternetException();
    } on RequestTimeout {
      throw const RequestTimeout();
    }
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    _print(url);
    _print(data);
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      return response.modify;
    } on SocketException {
      throw const InternetException();
    } on RequestTimeout {
      throw const RequestTimeout();
    }
  }
}

extension _HttpResponseExtension on http.Response {
  dynamic get modify {
    switch (statusCode) {
      case 200:
        dynamic data = jsonDecode(body);
        return data;
      case 400:
        throw const InvalidUrlException();
      default:
        throw FetchDataException(
          "Error occurred while communication with server $statusCode",
        );
    }
  }
}
