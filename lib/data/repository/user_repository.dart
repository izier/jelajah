import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';

import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/service/api_service.dart';
import 'package:jelajah/data/service/database_service.dart';
import 'package:jelajah/domain/entity/login.dart';
import 'package:jelajah/domain/entity/register.dart';
import 'package:jelajah/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(Login login);
  Future<Either<Failure, String>> register(Register register);
  Future<Either<Failure, User>> saveLocalSession(Login login);
  Future<Either<Failure, User>> removeLocalSession(Login login);
  Future<Either<Failure, User>> checkLocalSession();
}

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;
  final DatabaseService databaseService;

  const UserRepositoryImpl({
    required this.apiService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, User>> login(Login login) async {
    try {
      final result = await apiService.loginUser(LoginModel.fromEntity(login));
      return Right(result.toEntity());
    } on ServerException {
      return const Left(
        ServerFailure('Kombinasi username atau password salah'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> register(Register register) async {
    try {
      final result = await apiService.registerUser(
        RegisterModel.fromEntity(register),
      );
      if (kDebugMode) print(result);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Username telah terdaftar, pilih username lain'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, User>> removeLocalSession(Login login) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> saveLocalSession(Login login) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> checkLocalSession() {
    throw UnimplementedError();
  }
}
