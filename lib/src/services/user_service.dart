// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/models/user_model/user_model.dart';

class UserService {
  static const String url = 'https://sandbox.api.lettutor.com';
  static Tokens? tokens;

  static User parseUser(String responseBody) {
    final parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }

  static loginByEmailAndPassword(String email, String password, Function(User, Tokens) callback) async {
    final response = await http.post(Uri.parse(url + "/auth/login"), body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final jsonEncode = json.encode(jsonDecode["user"]);
      final tokens = Tokens.fromJson(jsonDecode["tokens"]);
      final user = parseUser(jsonEncode);
      callback(user, tokens);
    } else {
      final jsonRes = json.decode(response.body);
      print(jsonRes);
      throw Exception(jsonRes["message"]);
    }
  }

  static registerWithEmailAndPassword(String email, String password, Function() callback) async {
    final response = await http.post(Uri.parse(url + "/auth/register"), body: {
      'email': email,
      'password': password,
      "source": "null",
    });

    if (response.statusCode == 201) {
      callback();
    } else {
      final jsonRes = json.decode(response.body);
      print(jsonRes);
      throw Exception(jsonRes["message"]);
    }
  }

  static addAndRemoveTutorFavorite(String tutorId, String token) async {
    final response = await http.post(
      Uri.parse(url + '/user/manageFavoriteTutor'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'tutorId': tutorId,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static getTotalHourLesson(String token) async {
    final response = await http.get(
      Uri.parse(url + '/call/total'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      return jsonRes["total"];
    } else {
      return null;
    }
  }

  static Future<BookingInfo> fetchNextLesson(String token) async {
    final dateTime = DateTime.now().millisecondsSinceEpoch;
    final response = await http.get(
      Uri.parse(url + '/booking/next?dateTime=$dateTime'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      final listData = jsonRes["data"] as List;
      final arrLesson = listData.map((e) => BookingInfo.fromJson(e)).toList();
      arrLesson.sort(
          (a, b) => a.scheduleDetailInfo!.startPeriodTimestamp.compareTo(b.scheduleDetailInfo!.startPeriodTimestamp));
      return arrLesson[0];
    } else {
      throw Exception(json.decode(response.body)["message"]);
    }
  }
}
