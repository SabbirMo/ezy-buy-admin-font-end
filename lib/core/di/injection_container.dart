import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../src/features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../src/features/auth/data/repositories/auth_repository_impl.dart';
import '../../src/features/auth/domain/repositories/auth_repository.dart';
import '../../src/features/auth/domain/use_cases/auth_use_case.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Register dependencies (DioClient as async)
  getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  getIt.registerSingletonAsync<DioClient>(() async => DioClient());

  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(getIt()));

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerLazySingleton(() => DoLoginUseCase(getIt()));

  // Wait until all dependencies are ready
  await getIt.allReady();
}
