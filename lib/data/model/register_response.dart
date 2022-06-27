import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final String status;
  final String message;

  const RegisterResponse({
    required this.status,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
