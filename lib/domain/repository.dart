abstract interface class Repository {
  Future<List<String>> getQuestions();

  Future<void> saveUserId(String userId);

  Future<String?> getUserId();

  Future<void> updateFail(String item);

  Future<List<String>?> getFailedList();

  Future<List<String>?> deleteFailedItem(String item);
}
