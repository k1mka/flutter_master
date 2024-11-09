abstract interface class Repository {
  Future<String?> getUserId();

  Future<void> saveUserId(String userId);

  Future<void> updateFail(String item);

  Future<List<String>?> getFailedList();

  Future<List<Map<String, dynamic>>> getQuestions();

  Future<List<String>?> deleteFailedItem(String item);

  Future<void> updateQuestionByText(
      String questionText, Map<String, dynamic> data);
}
