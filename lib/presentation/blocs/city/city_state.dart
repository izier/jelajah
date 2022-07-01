part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityHasData extends CityState {
  final List cities;

  const CityHasData(this.cities);

  @override
  List<Object> get props => [cities];
}

class CityFailed extends CityState {
  final String message;

  const CityFailed(this.message);

  @override
  List<Object> get props => [message];
}
