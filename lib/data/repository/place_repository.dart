import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/common/failure.dart';
import 'package:jelajah/data/model/place.dart';
import 'package:jelajah/data/service/api_service.dart';

abstract class PlaceRepository {
  Future<Either<Failure, PlaceModel>> getDetail(int id);
  Future<Either<Failure, List<PlaceModel>>> getAll();
}

class PlaceRepositoryImpl implements PlaceRepository {
  final ApiService apiService;

  const PlaceRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, PlaceModel>> getDetail(int id) async {
    try {
      final result = await apiService.findPlaceById(id);
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
  Future<Either<Failure, List<PlaceModel>>> getAll() async {
    try {
      final result = await apiService.findAllPlaces();
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
