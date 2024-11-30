import 'package:flutter_master/data/datasources/locale/local_storage.dart';
import 'package:flutter_master/data/datasources/models/question_model.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';
import 'package:flutter_master/data/datasources/remote/storage_service/firestore_service.dart';
import 'package:flutter_master/domain/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({
    required this.firestoreService,
    required this.networkService,
    required this.localStorage,
  });

  final LocalStorage localStorage;
  final NetworkService networkService;
  final StorageServiceFirebase firestoreService;

  @override
  Future<void> saveUserId(String userId) async =>
      await localStorage.saveUserId(userId);

  @override
  Future<String?> getUserId() async => await localStorage.getUserId();

  @override
  Future<List<String>?> getFailedList() async =>
      await localStorage.getFailedList();

  @override
  Future<void> updateFail(String item) async => localStorage.updateFail(item);

  @override
  Future<List<String>?> deleteFailedItem(String item) async =>
      await localStorage.deleteFailedItem(item);

  @override
  Future<List<QuestionModel>> getQuestions() => firestoreService.getQuestions();

  @override
  Future<void> updateQuestionStatus(String questionText, bool isCorrect) =>
      firestoreService.updateQuestionStatus(questionText, isCorrect);
}
