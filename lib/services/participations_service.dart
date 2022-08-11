import 'dart:convert';

import 'package:http/http.dart';

import '../models/participation.dart';
import 'auth_service.dart';

class ParticipationService {
  final String baseUrl = "http://localhost:3000/";

  String error = '';

  Future<List<Participation>> getParticipations() async {
    final token = await AuthService().getToken();
    Response res = await get(Uri.parse(baseUrl + 'participations'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode < 200 || res.body == null) {
      return [];
    } else if (res.statusCode >= 400) {
      final errorObj = jsonDecode(res.body)['message'];

      if (errorObj.runtimeType == List) {
        error = errorObj[0];
      } else {
        error = jsonDecode(res.body)['message'];
      }
      return [];
    }
    List list = json.decode(res.body);

    return list.map((e) => new Participation.fromJson(e)).toList();
  }

  Future<bool> deleteParticipation(int id) async {
    final token = await AuthService().getToken();
    Response res = await delete(
        Uri.parse(baseUrl + 'participations/' + id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print(res.body);

    if (res.statusCode < 200 || res.body == null) {
      return false;
    } else if (res.statusCode >= 400) {
      final errorObj = jsonDecode(res.body)['message'];

      if (errorObj.runtimeType == List) {
        error = errorObj[0];
      } else {
        error = jsonDecode(res.body)['message'];
      }
      return false;
    }

    return true;
  }
}
