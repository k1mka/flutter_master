import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/data/models/question_model.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(this.repository) : super(SurveyInitial()) {
    getQuestion();
  }

  final Repository repository;

  Future<void> uploadNewQuestion() async {
    emit(SurveyLoading());
    final question = await _getRandomQuestion();
    if (question != null) {
      emit(SurveySuccessLoaded(question));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<void> registerFail(
      {required int questionId, required String questionText, required bool isCorrect}) async {
    emit(SurveyLoading());
    await repository.updateFail(questionText);
    await repository.updateQuestionStatusById(questionId, isCorrect);

    final newQuestion = await _getRandomQuestion();
    if (newQuestion != null) {
      emit(SurveySuccessLoaded(newQuestion));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<void> registerCorrectAnswer({required int questionId, required bool isCorrect}) async {
    emit(SurveyLoading());
    await repository.updateQuestionStatusById(questionId, isCorrect);

    final newQuestion = await _getRandomQuestion();
    if (newQuestion != null) {
      emit(SurveySuccessLoaded(newQuestion));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<void> getQuestion() async {
    emit(SurveyLoading());
    final question = await _getRandomQuestion();
    if (question != null) {
      emit(SurveySuccessLoaded(question));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<QuestionModel?> _getRandomQuestion() async {
    try {
      final question = await repository.getRandomQuestion();
      return question;
    } catch (e) {
      emit(SurveyInitial());
      return null;
    }
  }
}
