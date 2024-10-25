abstract interface class Repository {
  Future<void> testApi();

  Future<void> saveUserId(String userId);

  Future<String?> getUserId();
}
