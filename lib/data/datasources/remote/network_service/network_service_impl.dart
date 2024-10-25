import 'package:dio/dio.dart';
import 'package:flutter_master/core/templates/typedefs.dart';
import 'package:flutter_master/data/datasources/remote/network_service/error_parser.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';

class DioNetworkServiceImpl implements NetworkService {
  DioNetworkServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Response<T>> delete<T>(
    String url, {
    required HeaderMap headers,
  }) {
    try {
      final result = _dio.delete<T>(
        url,
        options: Options(headers: headers),
      );
      return result;
    } catch (error) {
      ErrorParser.parseError(error as DioException);
      rethrow;
    }
  }

  @override
  Future<Response<T>> get<T>({
    required String url,
    JsonMap? queryParameters,
    StringMap? headers,
    ResponseType? responseType,
  }) {
    try {
      final result = _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers, responseType: responseType),
      );
      return result;
    } catch (error) {
      ErrorParser.parseError(error as DioException);
      rethrow;
    }
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    HeaderMap? headers,
    required JsonMap body,
  }) async {
    try {
      final result = await _dio.post<T>(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return result;
    } catch (error) {
      ErrorParser.parseError(error as DioException);
      rethrow;
    }
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  }) {
    try {
      final result = _dio.put<T>(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return result;
    } catch (error) {
      ErrorParser.parseError(error as DioException);
      rethrow;
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  }) {
    try {
      final result = _dio.patch<T>(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return result;
    } catch (error) {
      ErrorParser.parseError(error as DioException);
      rethrow;
    }
  }
}
