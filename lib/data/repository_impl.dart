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
  Future<void> testApi() async {
    // TODO: implement testApi
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserId(String userId) async => await localStorage.saveUserId(userId);

  @override
  Future<String?> getUserId() async => await localStorage.getUserId();
}
