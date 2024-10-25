abstract interface class LocalStorage {
  Future<void> saveUserId(String userId);

  Future<String?> getUserId();
}
