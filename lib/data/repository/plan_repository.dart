import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/data/service/api_service.dart';

abstract class PlanRepository {
  Future<Either<Failure, PlanModel>> getDetail(int id);
  Future<Either<Failure, List<PlanModel>>> getAll();
}

class PlanRepositoryImpl implements PlanRepository {
  final ApiService apiService;

  const PlanRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, PlanModel>> getDetail(int id) async {
    try {
      final result = await apiService.findPlanById(id);
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Failed'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getAll() async {
    try {
      final result = await apiService.findAllPlans();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure('Failed'),
      );
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
