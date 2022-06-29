import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';

import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/service/api_service.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> login(LoginModel loginModel);
  Future<Either<Failure, String>> register(RegisterModel registerModel);
}

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  const UserRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, String>> login(LoginModel loginModel) async {
    try {
      final result = await apiService.loginUser(loginModel);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Kombinasi username atau password salah'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> register(RegisterModel registerModel) async {
    try {
      final result = await apiService.registerUser(registerModel);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Username telah terdaftar'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
