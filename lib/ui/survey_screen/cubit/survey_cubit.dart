import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/data/datasources/remote/storage_service/firestore_service.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(this.repository, this.firestoreService) : super(SurveyInitial()) {
    getQuestion();
  }

  final Repository repository;
  final FirestoreService firestoreService;

  Future<void> uploadNewQuestion() async {
    emit(SurveyLoading());
    final question = await _getRandomQuestionFromFirestore();
    if (question != null) {
      emit(SurveySuccessLoaded(question));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<void> registerFail(String question) async {
    emit(SurveyLoading());
    await repository.updateFail(question);
    final newQuestion = await _getRandomQuestionFromFirestore();
    if (newQuestion != null) {
      emit(SurveySuccessLoaded(newQuestion));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<void> getQuestion() async {
    emit(SurveyLoading());
    final question = await _getRandomQuestionFromFirestore();
    if (question != null) {
      emit(SurveySuccessLoaded(question));
    } else {
      emit(SurveyInitial());
    }
  }

  Future<String?> _getRandomQuestionFromFirestore() async {
    final questions = await firestoreService.getQuestions();
    final unansweredQuestions =
        questions.where((q) => q['answered_correctly'] == false).toList();
    if (unansweredQuestions.isNotEmpty) {
      final random = Random();
      final question =
          unansweredQuestions[random.nextInt(unansweredQuestions.length)];
      return question['text'] as String?;
    } else {
      emit(SurveyInitial());
    }
    return null;
  }

  Future<void> registerCorrectAnswer(String questionText) async {
    await firestoreService
        .updateQuestionByText(questionText, {'answered_correctly': true});

    final newQuestion = await _getRandomQuestionFromFirestore();
    if (newQuestion != null) {
      emit(SurveySuccessLoaded(newQuestion));
    } else {
      emit(SurveyInitial());
    }
  }
}
