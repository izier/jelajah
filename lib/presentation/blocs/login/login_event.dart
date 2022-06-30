part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final LoginModel user;

  const LoginUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}
