import 'package:flutter_master/core/logger/composite_logger.dart';
import 'package:flutter_master/core/logger/composite_logger_impl.dart';
import 'package:flutter_master/core/router/app_router.dart';
import 'package:flutter_master/core/router/go_router.dart';
import 'package:flutter_master/data/datasources/locale/local_storage.dart';
import 'package:flutter_master/data/datasources/locale/local_storage_impl.dart';
import 'package:flutter_master/data/datasources/remote/network_service/dio_service.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service.dart';
import 'package:flutter_master/data/datasources/remote/network_service/network_service_impl.dart';
import 'package:flutter_master/data/datasources/storage_service.dart';
import 'package:flutter_master/data/datasources/remote/storage_service/storage_service_firebase_impl.dart';
import 'package:flutter_master/domain/repository_impl.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final _getIt = GetIt.instance;

final getLogger = _getIt<CompositeLogger>();
final getRouter = _getIt<AppRouter>();
final getRepo = _getIt<Repository>();

Future<void> serviceLocator() async => setupSync();

void setupSync() {
  _getIt.registerLazySingleton<NetworkService>(
      () => NetworkServiceImpl(DioService()));
  _getIt.registerLazySingleton<AppRouter>(() => GoAppRouter());
  _getIt.registerSingleton<CompositeLogger>(
      CompositeLoggerImpl(logger: Logger()));
  _getIt.registerSingleton<LocalStorage>(LocalStorageImpl());
  _getIt
      .registerSingleton<StorageService>(StorageServiceFirebaseImpl());

  _getIt.registerSingleton<Repository>(RepositoryImpl(
    localStorage: _getIt<LocalStorage>(),
    networkService: _getIt<NetworkService>(),
    firestoreService: _getIt<StorageService>(),
  ));
}
