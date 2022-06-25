import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final baseUrl = 'https://jelajah-back-end.sysfdn.repl.co';

  Future registerUser() async {
    await _client.get(Uri.parse(baseUrl + '/login'));
  }

  Future loginUser() async {
    await _client.get(Uri.parse(baseUrl + '/login'));
  }

  Future findUserById(String id) async {
    await _client.get(Uri.parse(baseUrl + '/users'));
  }
}
