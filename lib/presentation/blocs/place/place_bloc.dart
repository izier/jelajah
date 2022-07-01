import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/place.dart';
import 'package:jelajah/data/repository/place_repository.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  PlaceRepository placeRepository;
  PlaceBloc({required this.placeRepository}) : super(PlaceInitial()) {
    on<GetPlaceEvent>((event, emit) async {
      emit(PlaceLoading());
      final result = await placeRepository.getAll();

      result.fold((failure) {
        emit(PlaceFailed(failure.message));
      }, (data) {
        emit(PlaceHasData(data));
      });
    });
  }
}
