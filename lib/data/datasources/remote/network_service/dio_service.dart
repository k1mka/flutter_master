import 'package:dio/dio.dart';
import 'package:flutter_master/core/env.dart';
import 'package:flutter_master/data/datasources/remote/network_service/logging_interseptor.dart';

class DioService {
  final Dio dio;

  DioService() : dio = Dio() {
    dio.options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    dio.interceptors.add(LoggingInterceptor());
  }
}
