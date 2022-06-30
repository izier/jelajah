import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/login_response.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/model/register_response.dart';
import 'package:jelajah/data/model/user.dart';

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final String baseUrl = 'https://jelajah-back-end.sysfdn.repl.co';
  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<String> registerUser(RegisterModel registerModel) async {
    final response = await _client.post(
      Uri.parse(baseUrl + '/register'),
      headers: headers,
      body: jsonEncode(registerModel.toJson()),
    );
    if (response.statusCode == 200) {
      final result = RegisterResponse.fromJson(json.decode(response.body));
      return result.message;
    } else {
      throw ServerException();
    }
  }

  Future<UserModel> loginUser(LoginModel loginModel) async {
    final response = await _client.post(
      Uri.parse(baseUrl + '/login'),
      headers: headers,
      body: jsonEncode(loginModel.toJson()),
    );
    if (response.statusCode == 200) {
      final result = LoginResponse.fromJson(json.decode(response.body));
      final user = UserModel(
          id: result.id,
          fullname: result.fullname,
          username: result.username,
          password: result.password,
          points: result.points);
      return user;
    } else {
      throw ServerException();
    }
  }

  Future findUserById(String id) async {
    await _client.get(Uri.parse(baseUrl + 'users/' + id));
  }
}
