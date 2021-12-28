// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
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
      throw Exception('Failed to login');
    }
  }
}
