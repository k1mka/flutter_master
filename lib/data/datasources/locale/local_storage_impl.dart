import 'package:flutter_master/data/datasources/locale/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  static const _userIdKey = 'userId';
  static const _failedQuestionsKey = '_failedQuestions';

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> saveUserId(String userId) async {
    final prefs = await _prefs;
    await prefs.setString(_userIdKey, userId);
  }

  @override
  Future<String?> getUserId() async {
    final prefs = await _prefs;
    return prefs.getString(_userIdKey);
  }

  @override
  Future<List<String>?> getFailedList() async {
    final prefs = await _prefs;
    return prefs.getStringList(_failedQuestionsKey);
  }

  @override
  Future<void> updateFail(String item) async {
    final prefs = await _prefs;
    final failedList = prefs.getStringList(_failedQuestionsKey) ?? [];

    if (!failedList.contains(item)) {
      failedList.add(item);
    }

    await prefs.setStringList(_failedQuestionsKey, failedList);
  }

  @override
  Future<List<String>?> deleteFailedItem(String item) async {
    final prefs = await _prefs;
    final failedList = prefs.getStringList(_failedQuestionsKey) ?? [];

    failedList.remove(item);

    await prefs.setStringList(_failedQuestionsKey, failedList);

    return failedList;
  }
}
