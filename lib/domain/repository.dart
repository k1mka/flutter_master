import 'package:flutter_master/data/datasources/models/question_model.dart';

abstract interface class Repository {
  Future<String?> getUserId();

  Future<void> saveUserId(String userId);

  Future<void> updateFail(String item);

  Future<List<String>?> getFailedList();

  Future<List<QuestionModel>> getQuestions();

  Future<List<String>?> deleteFailedItem(String item);

  Future<void> updateQuestionStatus(String questionText, bool isCorrect);
}
