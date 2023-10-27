import 'package:dio/dio.dart';

import '../../res/api_info/api_info.dart';

class DioManager {
  static const _baseUrl = ApiConstants.baseUrl;

  static DioManager? _proxy;

  static DioManager get instance => _proxy ??= DioManager._init(_baseUrl);

  static DioManager getInstance(String baseUrl) {
    return _proxy ??= DioManager._init(baseUrl);
  }

  late final Dio dio;

  DioManager._init(String baseUrl) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: true,
      ),
    );
  }
}
