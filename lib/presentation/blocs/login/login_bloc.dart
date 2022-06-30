import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jelajah/data/repository/user_repository.dart';
import 'package:jelajah/domain/entity/login.dart';
import 'package:jelajah/domain/entity/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      final user = event.user;

      emit(LoginLoading());

      final result = await userRepository.login(user);

      result.fold((failure) {
        emit(LoginFailed(failure.message));
      }, (success) {
        emit(LoginSuccess(success));
      });
    });
  }
}
