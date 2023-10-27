import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_andomie/core.dart';
import 'package:get_it/get_it.dart';

import '../data/cache/auth_cache_manager.dart';
import '../data/network/dio_manager.dart';
import '../data/network/http_overrides.dart';
import '../data/service/auth_service.dart';
import '../data/service/trade_service.dart';
import '../data/service/user_service.dart';
import '../repository/login_repository.dart';
import '../repository/trade_repository.dart';
import '../repository/user_repository.dart';
import '../res/api_info/api_info.dart';

/// di reference variable
GetIt locator = GetIt.instance;

/// Root function for di
Future<void> diInit() async {
  /// Base
  await _base();

  await _network();
  await _authorization();

  await _user();
  await _trades();

  /// Globalization (ex. https, shared_preferences, etc variables)
  await _globalInit();

  /// Ensure the injections
  await locator.allReady();
}

/// Should be initializing beginning
Future<void> _base() async {
  /// App initialized
  WidgetsFlutterBinding.ensureInitialized();
}

/// Should be initializing ending
Future<void> _globalInit() async {
  HttpOverrides.global = locator<ApplicationHttpOverrides>();
}

/// API or Networks
Future<void> _network() async {
  /// Connectivity
  locator.registerLazySingleton<ConnectivityProvider>(() {
    return ConnectivityProvider.I;
  });

  /// ApplicationHttpOverrides
  locator.registerLazySingleton<ApplicationHttpOverrides>(() {
    return ApplicationHttpOverrides();
  });

  /// DioManager
  locator.registerLazySingleton<DioManager>(() {
    return DioManager.getInstance(ApiConstants.baseUrl);
  });
}

/// Authorizations
Future<void> _authorization() async {
  /// AuthService
  locator.registerLazySingleton<AuthService>(() {
    return AuthService(locator());
  });

  /// AuthCacheManager
  locator.registerLazySingleton<AuthCacheManager>(() {
    return AuthCacheManager();
  });

  /// Repository
  locator.registerFactory<LoginRepository>(() {
    return LoginRepository(
      authService: locator<AuthService>(),
      cacheManager: locator<AuthCacheManager>(),
    );
  });
}

/// User
Future<void> _user() async {
  /// Service
  locator.registerLazySingleton<UserService>(() {
    return UserService(
      locator<DioManager>(),
      locator<AuthCacheManager>(),
    );
  });

  /// Repository
  locator.registerFactory<UserRepository>(() {
    return UserRepository(
      service: locator<UserService>(),
    );
  });
}

/// Trades
Future<void> _trades() async {
  /// Service
  locator.registerLazySingleton<TradeService>(() {
    return TradeService(
      locator<DioManager>(),
      locator<AuthCacheManager>(),
      locator<ConnectivityProvider>(),
    );
  });

  /// Repository
  locator.registerFactory<TradeRepository>(() {
    return TradeRepository(
      service: locator<TradeService>(),
    );
  });
}
