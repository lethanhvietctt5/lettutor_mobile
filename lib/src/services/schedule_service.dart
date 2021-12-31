import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
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

  static Future<List<BookingInfo>> getStudentBookedClass(String studentId, String token) async {
    final current = DateTime.now().millisecondsSinceEpoch;
    final response = await http.get(
      Uri.parse("$url/booking/list/student?page=1&perPage=20&dateTimeLte=$current&orderBy=meeting&sortBy=desc"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      final listBooked = res["data"]["rows"];
      final arr = listBooked.map((schedule) => BookingInfo.fromJson(schedule)).toList().cast<BookingInfo>();
      return arr;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
