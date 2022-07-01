part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetCityEvent extends CityEvent {}
