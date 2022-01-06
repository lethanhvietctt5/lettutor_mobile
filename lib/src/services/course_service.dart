import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor_mobile/src/models/course_model/course_category.dart';
import 'package:lettutor_mobile/src/models/course_model/course_model.dart';

class CourseService {
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<List<Course>> getListCourseWithPagination(int page, int size, String token) async {
    final response = await http.get(
      Uri.parse("$url/course?page=$page&size=$size"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      final courses = res["data"]["rows"] as List;
      final arr = courses.map((e) => Course.fromJson(e)).toList();
      return arr;
    } else {
      throw Exception('Cannot get list course');
    }
  }

  static Future<List<CourseCategory>> getAllCourseCategories(String token) async {
    final response = await http.get(
      Uri.parse("$url/content-category"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      final courses = res["rows"] as List;
      final arr = courses.map((e) => CourseCategory.fromJson(e)).toList();
      return arr;
    } else {
      throw Exception('Cannot get list course');
    }
  }
}
