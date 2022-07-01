import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/repository/city_repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository cityRepository;

  CityBloc({required this.cityRepository}) : super(CityInitial()) {
    on<GetCityEvent>((event, emit) async {
      emit(CityLoading());

      final result = await cityRepository.getAll();

      result.fold((failure) {
        emit(CityFailed(failure.message));
      }, (data) {
        emit(CityHasData(data));
      });
    });
  }
}
