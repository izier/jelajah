import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/login_response.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/model/register_response.dart';

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final baseUrl = 'https://jelajah-back-end.sysfdn.repl.co/';

  Future<String> registerUser(RegisterModel registerModel) async {
    final response = await _client.post(
      Uri.parse(baseUrl + 'register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerModel.toJson(),
    );
    if (response.statusCode == 200) {
      final result = RegisterResponse.fromJson(json.decode(response.body));
      return result.message;
    } else {
      throw ServerException();
    }
  }

  Future<String> loginUser(LoginModel loginModel) async {
    final response = await _client.post(
      Uri.parse(baseUrl + 'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginModel.toJson(),
    );
    if (response.statusCode == 200) {
      final result = LoginResponse.fromJson(json.decode(response.body));
      return result.message;
    } else {
      throw ServerException();
    }
  }

  Future findUserById(String id) async {
    await _client.get(Uri.parse(baseUrl + 'users/' + id));
  }
}
