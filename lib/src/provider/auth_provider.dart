import 'package:flutter/cupertino.dart';
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/models/user_model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  late User userLoggedIn;
  Tokens? tokens;


  void logIn(User user, Tokens tokens) {
    userLoggedIn = user;
    tokens = tokens;
    notifyListeners();
  }

  void logOut() {
    tokens = null;
    notifyListeners();
  }
}
