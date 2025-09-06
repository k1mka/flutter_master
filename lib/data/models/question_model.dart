import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';

part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    required int userId,
    required String text,
    bool? isCorrect,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}
