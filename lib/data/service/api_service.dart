import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/common/exception.dart';
import 'package:jelajah/data/model/city.dart';
import 'package:jelajah/data/model/login_model.dart';
import 'package:jelajah/data/model/login_response.dart';
import 'package:jelajah/data/model/mission.dart';
import 'package:jelajah/data/model/mission_response.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/data/model/register_response.dart';
import 'package:jelajah/data/model/user.dart';
import 'package:jelajah/data/model/place.dart';

class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final String baseUrl = 'https://jelajah-back-end.izier.repl.co';
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
        points: result.points,
        plans: result.plans!.isEmpty ? [] : result.plans,
      );
      return user;
    } else {
      throw ServerException();
    }
  }

  Future<PlanModel> addPlan(PlanModel plan) async {
    final response = await _client.post(
      Uri.parse(
          baseUrl + '/users/' + Constant.userSession.toString() + '/plans'),
      headers: headers,
      body: jsonEncode(plan.toJson()),
    );
    if (response.statusCode == 200) {
      final result = plan;
      return result;
    } else {
      throw ServerException();
    }
  }

  Future<String> updateMission(MissionModel mission) async {
    final response = await _client.post(
      Uri.parse(
        baseUrl + '/users/' + Constant.userSession.toString() + '/missions',
      ),
      headers: headers,
      body: jsonEncode(mission.toJson()),
    );
    if (response.statusCode == 200) {
      final result = MissionResponse.fromJson(json.decode(response.body));
      return result.message;
    } else {
      throw ServerException();
    }
  }

  Future<String> uploadPhotos(String paths, int userId, int missionId) async {
    Uri uri =
        Uri.parse(baseUrl + "/users/{$userId}/missions/{$missionId}/image");
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', paths));
    http.StreamedResponse response = await request.send();
    var responseBytes = await response.stream.toBytes();
    var responseString = utf8.decode(responseBytes);
    return responseString;
  }

  Future<UserModel> findUserById(int id) async {
    final response =
        await _client.get(Uri.parse(baseUrl + '/users/' + id.toString()));
    if (response.statusCode == 200) {
      final result = UserModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }

  Future<List<CityModel>> findAllCities() async {
    final response = await _client.get(Uri.parse(baseUrl + '/cities'));
    if (response.statusCode == 200) {
      return List<CityModel>.from(
        json.decode(response.body).map((x) => CityModel.fromJson(x)),
      );
    } else {
      throw ServerException();
    }
  }

  Future<CityModel> findCityById(int id) async {
    final response =
        await _client.get(Uri.parse(baseUrl + '/cities/' + id.toString()));
    if (response.statusCode == 200) {
      final result = CityModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }

  Future<List<PlaceModel>> findAllPlaces() async {
    final response = await _client.get(Uri.parse(baseUrl + '/places'));
    if (response.statusCode == 200) {
      return List<PlaceModel>.from(
          json.decode(response.body).map((x) => PlaceModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }

  Future<PlaceModel> findPlaceById(int id) async {
    final response =
        await _client.get(Uri.parse(baseUrl + '/places/' + id.toString()));
    if (response.statusCode == 200) {
      return PlaceModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<List<PlanModel>> findAllPlans() async {
    final response = await _client.get(Uri.parse(baseUrl + '/places'));
    if (response.statusCode == 200) {
      return List<PlanModel>.from(
          json.decode(response.body).map((x) => PlanModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }

  Future<PlanModel> findPlanById(int id) async {
    final response =
        await _client.get(Uri.parse(baseUrl + '/places/' + id.toString()));
    if (response.statusCode == 200) {
      return PlanModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<PlanModel> uploadPlan(int id) async {
    final response =
        await _client.get(Uri.parse(baseUrl + '/places/' + id.toString()));
    if (response.statusCode == 200) {
      return PlanModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
