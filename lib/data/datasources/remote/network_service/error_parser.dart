import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_error.dart';

abstract class ErrorParser {
  static void parseError(DioException dioError) {
    final baseUrl = dioError.requestOptions.baseUrl;
    final path = dioError.requestOptions.path;
    final statusCode = dioError.response?.statusCode;
    final responseMap = dioError.response?.data;

    if (dioError.type == DioExceptionType.connectionError ||
        dioError.type == DioExceptionType.receiveTimeout ||
        dioError.type == DioExceptionType.sendTimeout) {
      throw TimeOutError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else if (statusCode == 401) {
      throw UnauthorizedError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else if (statusCode == 403) {
      throw ValidatorError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else if (dioError.error is SocketException) {
      throw ConnectionError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else {
      throw ValidatorError(
        dioError,
        errorMessage: responseMap,
      );
    }
  }
}
