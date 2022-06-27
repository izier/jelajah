import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String status;
  final String message;

  const LoginResponse({
    required this.status,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
