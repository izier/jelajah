import 'package:get_it/get_it.dart';
import 'package:jelajah/data/repository/city_repository.dart';
import 'package:jelajah/data/repository/place_repository.dart';
import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/data/service/api_service.dart';
import 'package:jelajah/presentation/blocs/city/city_bloc.dart';
import 'package:jelajah/presentation/blocs/login/login_bloc.dart';
import 'package:jelajah/presentation/blocs/place/place_bloc.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => RegisterBloc(userRepository: locator()),
  );
  locator.registerFactory(
    () => LoginBloc(userRepository: locator()),
  );
  locator.registerFactory(
    () => UserBloc(userRepository: locator()),
  );
  locator.registerFactory(
    () => CityBloc(cityRepository: locator()),
  );
  locator.registerFactory(
    () => PlaceBloc(placeRepository: locator()),
  );

  // repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      apiService: locator(),
    ),
  );
  locator.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      apiService: locator(),
    ),
  );
  locator.registerLazySingleton<PlaceRepository>(
    () => PlaceRepositoryImpl(
      apiService: locator(),
    ),
  );

  /// Initialize for Services
  locator.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
}
