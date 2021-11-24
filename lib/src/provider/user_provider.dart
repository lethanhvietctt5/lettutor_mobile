import 'package:flutter/cupertino.dart';
import 'package:lettutor_mobile/src/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  UserProvider([this.user]) {
    user ??=
        User("lethanhviet7c@gmail.com", "Le Thanh Viet", DateTime(2000, 10, 22), "Viet Nam", "Beginner", "0902794731");
    notifyListeners();
  }

  void updateUser(User user) {
    this.user = user;
    notifyListeners();
  }
}
