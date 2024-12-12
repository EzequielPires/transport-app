import 'package:app/core/services/api_service.dart';
import 'package:app/layers/data/repositories/auth_repository_remote.dart';
import 'package:app/layers/domain/repositories/auth_repository.dart';
import 'package:app/layers/presentation/blocs/auth/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final authInjec = GetIt.instance;

Future<void> authInit() async {
  authInjec.registerLazySingleton<Dio>(
    () => Dio(),
  );

  authInjec.registerLazySingleton<ApiService>(
    () => ApiService(
      dio: authInjec(),
    ),
  );

  authInjec.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryRemote(
      apiService: authInjec(),
    ),
  );

  authInjec.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: authInjec(),
    ),
  );
}
