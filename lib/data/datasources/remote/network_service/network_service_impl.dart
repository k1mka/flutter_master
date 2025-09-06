import 'package:flutter_master/core/constants.dart';
import 'package:flutter_master/data/datasources/remote/network_service/custom_exception.dart';
import 'package:flutter_master/data/datasources/remote/network_service/dio_service.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';
import 'package:flutter_master/data/models/question_model.dart';
import 'package:dio/dio.dart';

class NetworkServiceImpl implements NetworkService {
  NetworkServiceImpl(this._dioService);

  final DioService _dioService;

  static const Map<String, dynamic> _defaultExtras = {
    Constants.requiresAuthTokenKey: false,
  };

  @override
  Future<QuestionModel> getRandomQuestion() async {
    try {
      final response = await _dioService.dio.get(
        Constants.randomQuestionEndPoint,
        options: Options(
          extra: _defaultExtras,
        ),
      );
      final Map<String, dynamic> responseData = response.data;
      return QuestionModel.fromJson(responseData);
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<void> updateQuestionStatus(int questionId, bool isCorrect) async {
    try {
      await _dioService.dio.patch(
        '${Constants.updateQuestionStatusEndPoint}/$questionId',
        data: {
          Constants.isCorrectApiField: isCorrect,
        },
        options: Options(
          extra: _defaultExtras,
          headers: {
            Constants.contentTypeHeader: Constants.applicationJson,
          },
        ),
      );
    } on DioException catch (ex) {
      throw CustomException.fromDioException(ex);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}
