import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/user/booking.dart';
import 'package:lettutor_mobile/src/models/user/upcomming.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  final String email;
  final String fullName;
  DateTime birthDay;
  String phone;
  String country;
  String level;
  List<Upcomming> upcomming = [];
  String topicToLearn;
  List<Booking> bookingHistory = [];

  User({
    required this.email,
    required this.fullName,
    required this.birthDay,
    required this.country,
    required this.level,
    required this.topicToLearn,
    required this.bookingHistory,
    this.phone = "",
  }) {
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
}
