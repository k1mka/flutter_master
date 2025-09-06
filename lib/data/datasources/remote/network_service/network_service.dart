import 'package:flutter_master/data/models/question_model.dart';

abstract interface class NetworkService {
  Future<QuestionModel> getRandomQuestion();
  Future<void> updateQuestionStatus(int questionId, bool isCorrect);
}
