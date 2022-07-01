import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/domain/entity/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userRepository.getDetail(event.id);

      result.fold((failure) {
        emit(UserFailed(failure.message));
      }, (data) {
        emit(UserHasData(data));
      });
    });

    on<AddPlanEvent>((event, emit) async {
      emit(UserLoading());

      final result = await userRepository.addPlan(event.plan);

      result.fold((failure) {
        emit(AddFailed(failure.message));
      }, (data) {
        emit(AddSuccess(data));
      });
    });
  }
}
