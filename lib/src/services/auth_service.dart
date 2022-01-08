import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/models/user_model/user_model.dart';

class AuthService {
  static const String url = 'https://sandbox.api.lettutor.com';
  //static Tokens? tokens;

  static User parseUser(String responseBody) {
    final parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }

  static loginByEmailAndPassword(String email, String password, Function(User, Tokens) callback) async {
    final response = await http.post(Uri.parse(url + "/auth/login"), body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final tokens = Tokens.fromJson(jsonDecode["tokens"]);
      final user = User.fromJson(jsonDecode["user"]);
      callback(user, tokens);
    } else {
      final jsonRes = json.decode(response.body);
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
      throw Exception(jsonRes["message"]);
    }
  }

  static forgotPassword(String email, String token) async {
    final response = await http.post(Uri.parse(url + "/auth/forgot-password"), body: {
      'email': email,
      'token': token,
    });

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      throw Exception(jsonRes["message"]);
    } else {
      final jsonRes = json.decode(response.body);
      throw Exception(jsonRes["message"]);
    }
  }
}
