import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:never_test/setting/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class ApiService {
  static late Dio client;
  BaseOptions _options = BaseOptions(
    baseUrl: endPointAPI,
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 10),
    sendTimeout: Duration(seconds: 10),
    headers: {},
  );

  PrettyDioLogger prettyDioLogger = PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      filter: (options, args) {
        // don't print responses with unit8 list data
        return !args.isResponse || !args.hasUint8ListData;
      });

  Interceptor customInterceptor = CustomInterceptor();

  ApiService.initialize() {
    client = Dio(_options);
    client.interceptors.addAll({prettyDioLogger, customInterceptor});
  }

  static setHeaderToken(String token) {
    log("\n setHeaderToken => $token");
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    client.options.headers = headers;
  }

  static clearHeaderToken() {
    log("\n clearHeaderToken ");
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };
    client.options.headers = headers;
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.connectionError:
        throw NoInternetException(requestOptions: err.requestOptions);
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        throw UnknownErrorException(requestOptions: err.requestOptions);
    }
  }
}

class TimeoutException extends DioException {
  TimeoutException({required super.requestOptions});
  @override
  String toString() {
    return "Connection timeout. Please try again later";
  }
}

class UnknownErrorException extends DioException {
  UnknownErrorException({required super.requestOptions});
  @override
  String toString() {
    return "Unknown error occured. Please try again later";
  }
}

class NoInternetException extends DioException {
  NoInternetException({required super.requestOptions});
  @override
  String toString() {
    return "No internet detected, please check your connection";
  }
}
