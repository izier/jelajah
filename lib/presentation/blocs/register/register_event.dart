part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final RegisterModel user;

  const RegisterUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}
