import 'package:dio/dio.dart';
import 'package:flutter_master/core/templates/typedefs.dart';

typedef HeaderMap = StringMap;

abstract interface class NetworkService {
  Future<Response<T>> get<T>({
    required String url,
    StringMap? headers,
    JsonMap? queryParameters,
    ResponseType? responseType,
  });

  Future<Response<T>> post<T>(
    String url, {
    HeaderMap? headers,
    required JsonMap body,
  });

  Future<Response<T>> put<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  });

  Future<Response<T>> delete<T>(
    String url, {
    required HeaderMap headers,
  });

  Future<Response<T>> patch<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  });
}
