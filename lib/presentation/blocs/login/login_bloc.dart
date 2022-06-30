import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/user.dart';
import 'package:jelajah/data/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoading());
      final user = event.user;
      final result = await userRepository.login(user);

      result.fold((failure) {
        emit(LoginFailed(message: failure.message));
      }, (data) {
        emit(LoginSuccess(user: data));
      });
    });
  }
}
