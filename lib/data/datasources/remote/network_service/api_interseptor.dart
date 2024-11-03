import 'package:dio/dio.dart';
import 'package:flutter_master/domain/repository.dart';

/// A class that holds intercepting logic for API-related requests. This is
/// the first interceptor in case of both request and response.
///
/// The primary purpose is to handle token injection and response success validation.
///
/// Since this interceptor isn't responsible for error handling, if an exception
/// occurs, it is passed on to the next [Interceptor] or to [Dio].
class ApiInterceptor extends Interceptor {
  final Repository repository;

  ApiInterceptor(this.repository);

  /// This method intercepts an outgoing request before it reaches the
  /// destination.
  ///
  /// [options] contains HTTP request information and configuration.
  /// [handler] is used to forward, resolve, or reject requests.
  ///
  /// This method is used to inject any token/API keys in the request.
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken') &&
        options.extra['requiresAuthToken'] == true) {
      // TODO(George): change to auth code
      final token = await repository.getUserId();
      options.headers.addAll(
        <String, Object?>{'Authorization': 'Bearer $token'},
      );
      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }

  /// This method intercepts an incoming response before it reaches Dio.
  ///
  /// [response] contains HTTP [Response] info.
  /// [handler] is used to forward, resolve, or reject responses.
  ///
  /// This method is used to check the success of the response by verifying
  /// its headers.
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data['headers']['error'] == 0;

    if (success) {
      handler.next(response);
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }
}
