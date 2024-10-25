import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_master/data/datasources/remote/network_service/failure.dart';

sealed class NetworkError extends Failure {
  NetworkError(
      super.error, {
        this.baseUrl,
        this.path,
        this.statusCode,
        this.errorMessage,
      });

  factory NetworkError.fromDioError(DioException error) {
    final dioError = error;
    final baseUrl = error.requestOptions.baseUrl;
    final path = error.requestOptions.path;
    final response = error.response;
    final statusCode = response?.statusCode;
    final responseMap = response?.data;
    if (error.error is SocketException) {
      return ConnectionError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else if (statusCode == 401) {
      return UnauthorizedError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeOutError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    } else {
      return ValidatorError(
        dioError,
        baseUrl: baseUrl,
        path: path,
        statusCode: statusCode,
        errorMessage: responseMap,
      );
    }
  }

  final String? baseUrl;
  final String? path;
  final int? statusCode;
  final dynamic errorMessage;

  @override
  String toString() =>
      'NetworkError{error: $error, baseUrl: $baseUrl, path: $path, statusCode: $statusCode, errorMessage: $errorMessage}';
}

class ConnectionError extends NetworkError {
  ConnectionError(
      super.error, {
        super.path,
        super.baseUrl,
        super.statusCode,
        super.errorMessage,
      });
}

class UnauthorizedError extends NetworkError {
  UnauthorizedError(
      super.error, {
        super.path,
        super.baseUrl,
        super.statusCode,
        super.errorMessage,
      });
}

class TimeOutError extends NetworkError {
  TimeOutError(
      super.error, {
        super.path,
        super.baseUrl,
        super.statusCode,
        super.errorMessage,
      });
}

class ValidatorError extends NetworkError {
  ValidatorError(
      super.error, {
        required super.errorMessage,
        super.path,
        super.baseUrl,
        super.statusCode,
      });
}
