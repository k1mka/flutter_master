abstract class FirestoreService {
  Future<List<Map<String, dynamic>>> getQuestions();

  Future<void> updateQuestionByText(
      String questionText, Map<String, dynamic> data);
}
