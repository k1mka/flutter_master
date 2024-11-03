abstract interface class LocalStorage {
  Future<void> saveUserId(String userId);

  Future<String?> getUserId();

  Future<List<String>?> getFailedList();

  Future<void> updateFail(String item);

  Future<List<String>?> deleteFailedItem(String item);
}
