import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      final user = event.user;
      final result = await userRepository.register(user);

      result.fold((failure) {
        emit(RegisterFailed(message: failure.message));
      }, (success) {
        emit(RegisterSuccess(message: success));
      });
    });
  }
}
