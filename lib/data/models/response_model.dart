import 'package:flutter_master/core/templates/typedefs.dart';

class ResponseModel<T> {
  final ResponseHeadersModel headers;
  final T body;

  const ResponseModel({
    required this.headers,
    required this.body,
  });

  factory ResponseModel.fromJson(JsonMap json) {
    return ResponseModel(
      headers: ResponseHeadersModel.fromJson(
        json['headers'] as JsonMap,
      ),
      body: json['body'] as T,
    );
  }
}

bool boolFromInt(int value) => value == 1;

class ResponseHeadersModel {
  final bool error;
  final String message;
  final String? code;

  const ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory ResponseHeadersModel.fromJson(JsonMap json) {
    return ResponseHeadersModel(
      error: boolFromInt(json['error'] as int),
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }
}
