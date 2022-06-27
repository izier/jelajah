import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';

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
  Future<Either<Failure, String>> login(LoginModel loginModel) async {
    try {
      final result = await apiService.loginUser(loginModel);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<String> register(RegisterModel registerModel) async {
    return await apiService.registerUser(registerModel);
  }
}
