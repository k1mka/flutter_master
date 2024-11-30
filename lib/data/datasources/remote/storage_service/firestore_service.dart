import 'package:flutter_master/data/datasources/models/question_model.dart';

abstract class StorageServiceFirebase {
  Future<List<QuestionModel>> getQuestions();

  Future<void> updateQuestionStatus(String questionText, bool isCorrect);
}
