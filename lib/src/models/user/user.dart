import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/user/upcomming.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  final String _email;
  final String _fullName;
  DateTime birthDate;
  String phone;
  String country;
  String level;
  List<Upcomming> upcomming = [];
  String topicToLearn;

  User(this._email, this._fullName, this.birthDate, this.country, this.level, this.topicToLearn, [this.phone = ""]) {
    upcomming.add(Upcomming(
        id: uuid.v4(),
        tutor: TutorsSample.tutors[0],
        timeStart: DateTime(2021, 11, 25, 6, 0, 0),
        timeEnd: DateTime(2021, 11, 25, 7, 0, 0)));

    upcomming.add(Upcomming(
        id: uuid.v4(),
        tutor: TutorsSample.tutors[1],
        timeStart: DateTime(2021, 11, 26, 6, 0, 0),
        timeEnd: DateTime(2021, 11, 26, 7, 0, 0)));
  }

  String get email => _email;
  String get fullName => _fullName;
}
