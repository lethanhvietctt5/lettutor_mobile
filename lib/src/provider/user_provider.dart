import 'package:flutter/cupertino.dart';
import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/user/upcomming.dart';
import 'package:lettutor_mobile/src/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  List<int> idFavorite = [];

  UserProvider([this.user]) {
    user ??=
        User("lethanhviet7c@gmail.com", "Le Thanh Viet", DateTime(2000, 10, 22), "Viet Nam", "Beginner", "0902794731");
    notifyListeners();
  }

  void updateUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void addUpcomming(Upcomming upcomming) {
    user!.upcomming.add(upcomming);
    notifyListeners();
  }

  void removeUpcomming(int index) {
    user!.upcomming.removeAt(index);
    notifyListeners();
  }

  void addFavorite(int index) {
    if (index < TutorsSample.tutors.length) {
      idFavorite.add(index);
      notifyListeners();
    }
  }

  void removeFavorite(int index) {
    if (index < TutorsSample.tutors.length) {
      idFavorite.removeWhere((element) => element == index);
      notifyListeners();
    }
  }
}
