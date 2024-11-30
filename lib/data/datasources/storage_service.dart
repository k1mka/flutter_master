import 'package:flutter_master/data/datasources/models/question_model.dart';

abstract class StorageService {
  Future<List<QuestionModel>> getQuestions();

  Future<void> updateQuestionStatus(String questionText, bool isCorrect);
}
