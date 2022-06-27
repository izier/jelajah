import 'package:dartz/dartz.dart';

import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/service/api_service.dart';

abstract class UserRepository {
  Future<String> login(LoginModel loginModel);
  Future<String> register(RegisterModel registerModel);
}

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  const UserRepositoryImpl({required this.apiService});

  @override
  Future<String> login(LoginModel loginModel) async {
    return await apiService.loginUser(loginModel);
  }

  @override
  Future<Either<FailureException, RestaurantDetail>> getRestaurantDetail(
      String id) async {
    try {
      final result = await remoteDataSource.getRestaurantDetail(id);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return const Left(FailureException('Failed to load Restaurant Lsit'));
    }
  }

  @override
  Future<String> register(RegisterModel registerModel) async {
    return await apiService.registerUser(registerModel);
  }
}
