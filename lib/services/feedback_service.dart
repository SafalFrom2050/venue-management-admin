import 'dart:convert';

import 'package:admin/models/Feedback.dart';
import 'package:http/http.dart';

import 'auth_service.dart';

class FeedbackService {
  final String baseUrl = "http://localhost:3000/";

  String error = '';

  Future<List<FeedbackInfo>> getFeedbacks() async {
    final token = await AuthService().getToken();
    Response res = await get(Uri.parse(baseUrl + 'feedbacks'), headers: {
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

    return list.map((e) => new FeedbackInfo.fromJson(e)).toList();
  }

  Future<bool> deleteFeedback(int id) async {
    final token = await AuthService().getToken();
    Response res = await delete(
        Uri.parse(baseUrl + 'feedbacks/' + id.toString()),
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
