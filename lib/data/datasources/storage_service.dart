import 'package:flutter_master/data/models/question_model.dart';

abstract interface class StorageService {
  Future<List<QuestionModel>> getQuestions();

  Future<void> updateQuestionStatus(String questionText, bool isCorrect);
}
