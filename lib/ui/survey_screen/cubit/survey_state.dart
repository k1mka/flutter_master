import 'package:flutter_master/data/models/question_model.dart';

sealed class SurveyState {}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveySuccessLoaded extends SurveyState {
  SurveySuccessLoaded(this.question);

  final QuestionModel question;
}
