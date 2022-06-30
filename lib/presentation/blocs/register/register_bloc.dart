import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/domain/entity/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      final user = event.user;

      emit(RegisterLoading());

      final result = await userRepository.register(user);

      result.fold((failure) {
        emit(RegisterFailed(failure.message));
      }, (success) {
        emit(RegisterSuccess(success));
      });
    });
  }
}
