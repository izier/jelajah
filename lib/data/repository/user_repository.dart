import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';
import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/mission.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/service/api_service.dart';
import 'package:jelajah/domain/entity/login.dart';
import 'package:jelajah/domain/entity/register.dart';
import 'package:jelajah/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getDetail(int id);
  Future<Either<Failure, User>> login(Login login);
  Future<Either<Failure, String>> register(Register register);
  Future<Either<Failure, PlanModel>> addPlan(PlanModel plan);
  Future<Either<Failure, String>> updateMission(MissionModel mission);
  Future<Either<Failure, String>> uploadPhoto(
    String path,
    int userId,
    int missionId,
  );
}

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  const UserRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, User>> getDetail(int id) async {
    try {
      final result = await apiService.findUserById(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(
        ServerFailure('Kombinasi username atau password salah'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }

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
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }

  @override
  Future<Either<Failure, String>> register(Register register) async {
    try {
      final result = await apiService.registerUser(
        RegisterModel.fromEntity(register),
      );
      if (kDebugMode) print(result);
      return Right(result.toString());
    } on ServerException {
      return const Left(
        ServerFailure('Username telah terdaftar, pilih username lain'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }

  @override
  Future<Either<Failure, PlanModel>> addPlan(PlanModel plan) async {
    try {
      final result = await apiService.addPlan(plan);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Terjadi kesalahan'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadPhoto(
      String path, int userId, int missionId) async {
    try {
      final result = await apiService.uploadPhotos(path, userId, missionId);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Terjadi kesalahan'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }

  @override
  Future<Either<Failure, String>> updateMission(
      MissionModel missionModel) async {
    try {
      final result = await apiService.updateMission(missionModel);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Terjadi kesalahan'),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Gagal dalam menghubungkan ke internet'),
      );
    }
  }
}
