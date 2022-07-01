part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitial extends PlaceState {}

class PlaceLoading extends PlaceState {}

class PlaceHasData extends PlaceState {
  final List<PlaceModel> places;

  const PlaceHasData(this.places);

  @override
  List<Object> get props => [places];
}

class PlaceFailed extends PlaceState {
  final String message;

  const PlaceFailed(this.message);

  @override
  List<Object> get props => [message];
}
