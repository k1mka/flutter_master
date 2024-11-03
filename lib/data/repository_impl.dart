import 'package:flutter_master/data/datasources/locale/local_storage.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';
import 'package:flutter_master/domain/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({
    required this.networkService,
    required this.localStorage,
  });

  final LocalStorage localStorage;
  final NetworkService networkService;

  @override
  Future<void> saveUserId(String userId) async => await localStorage.saveUserId(userId);

  @override
  Future<String?> getUserId() async => await localStorage.getUserId();

  @override
  Future<List<String>?> getFailedList() async => await localStorage.getFailedList();

  @override
  Future<void> updateFail(String item) async => localStorage.updateFail(item);

  @override
  Future<List<String>?> deleteFailedItem(String item) async =>
      await localStorage.deleteFailedItem(item);
}
