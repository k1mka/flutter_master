import 'package:flutter_master/data/datasources/remote/network_service/custom_exception.dart';
import 'package:flutter_master/data/datasources/remote/network_service/dio_service.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';
import 'package:dio/dio.dart';

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl(this._dioService);

  final DioService _dioService;

  static const _requiresAuthTokenKey = 'requiresAuthToken';
  static const _exampleEndPoint = '/breeds/list/all';

  static const _messageKey = 'message';

  static const Map<String, dynamic> _defaultExtras = {
    _requiresAuthTokenKey: false,
  };

  @override
  Future<List<String>> getQuestions() async {
    try {
      final response = await _dioService.dio.get(
        _exampleEndPoint,
        options: Options(
          extra: _defaultExtras,
        ),
      );
      final Map<String, dynamic> responseData = response.data[_messageKey];
      final List<String> questions = responseData.keys.toList();
      return questions;
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}
