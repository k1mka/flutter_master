import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(this.repository) : super(SurveyInitial()) {
    getQuestions();
  }

  final Repository repository;

  // TODO(George): get from fire store
  final List<String> questions = [
    'Разница между mixin и extension',
    'Объясни разницу между агрегацией и композицией',
    'Как поддерживать чистоту кода в проекте',
    'Какие типы параметров бывают в конструкторах',
    'Что такое Future',
  ];

  void getQuestions() async {
    // TODO(George): for test networking
    await repository.getQuestions();
  }

  void uploadNewQuestion() async {
    emit(SurveyLoading());
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  void registerFail(String question) async {
    emit(SurveyLoading());
    await repository.updateFail(question);
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  void getQuestion() async {
    emit(SurveyLoading());
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  String _getRandomQuestion() {
    final random = Random();
    return questions[random.nextInt(questions.length)];
  }
}
