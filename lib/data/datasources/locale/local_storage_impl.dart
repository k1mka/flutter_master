import 'package:flutter_master/core/constants.dart';
import 'package:flutter_master/data/datasources/locale/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> saveUserId(String userId) async {
    final prefs = await _prefs;
    await prefs.setString(Constants.userIdKey, userId);
  }

  @override
  Future<String?> getUserId() async {
    final prefs = await _prefs;
    return prefs.getString(Constants.userIdKey);
  }

  @override
  Future<List<String>?> getFailedList() async {
    final prefs = await _prefs;
    return prefs.getStringList(Constants.failedQuestionsKey);
  }

  @override
  Future<void> updateFail(String item) async {
    final prefs = await _prefs;
    final failedList = prefs.getStringList(Constants.failedQuestionsKey) ?? [];

    if (!failedList.contains(item)) {
      failedList.add(item);
    }

    await prefs.setStringList(Constants.failedQuestionsKey, failedList);
  }

  @override
  Future<List<String>?> deleteFailedItem(String item) async {
    final prefs = await _prefs;
    final failedList = prefs.getStringList(Constants.failedQuestionsKey) ?? [];

    failedList.remove(item);

    await prefs.setStringList(Constants.failedQuestionsKey, failedList);

    return failedList;
  }
}
