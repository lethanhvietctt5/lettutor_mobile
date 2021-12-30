import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile/src/models/schedule_model/schedule_model.dart';

class ScheduleService {
  static const String url = "https://sandbox.api.lettutor.com";

  static getTutorSchedule(String tutorId, String token) async {
    final response = await http.post(Uri.parse("$url/schedule"), headers: {
      "Authorization": "Bearer $token",
    }, body: {
      "tutorId": tutorId,
    });

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      final listSchedule = res["data"] as List;
      return listSchedule.map((schedule) => Schedule.fromJson(schedule)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
