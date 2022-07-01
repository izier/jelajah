import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';
import 'package:jelajah/data/model/city.dart';
import 'package:jelajah/data/service/api_service.dart';

abstract class CityRepository {
  Future<Either<Failure, CityModel>> getDetail(int id);
  Future<Either<Failure, List<CityModel>>> getAll();
}

class CityRepositoryImpl implements CityRepository {
  final ApiService apiService;

  const CityRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, CityModel>> getDetail(int id) async {
    try {
      final result = await apiService.findCityById(id);
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
  Future<Either<Failure, List<CityModel>>> getAll() async {
    try {
      final result = await apiService.findAllCities();
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
