import 'package:get_it/get_it.dart';
import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/data/service/api_service.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => RegisterBloc(userRepository: locator()),
  );

  // repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      apiService: locator(),
    ),
  );

  /// Initialize for Services
  locator.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
}
