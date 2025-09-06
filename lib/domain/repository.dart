import 'package:flutter_master/data/models/question_model.dart';

abstract interface class Repository {
  Future<String?> getUserId();

  Future<void> saveUserId(String userId);

  Future<void> updateFail(String questionText);

  Future<List<String>?> getFailedList();

  Future<List<String>?> deleteFailedItem(String item);

  Future<QuestionModel> getRandomQuestion();

  Future<void> updateQuestionStatusById(int questionId, bool isCorrect);
}
