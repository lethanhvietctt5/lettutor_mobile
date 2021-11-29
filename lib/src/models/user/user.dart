import 'package:lettutor_mobile/src/models/user/booking.dart';
import 'package:lettutor_mobile/src/models/user/session.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  final String email;
  final String fullName;
  DateTime birthDay;
  String phone;
  String country;
  String level;
  String topicToLearn;
  List<Booking> bookingHistory = [];
  List<Session> sessionHistory = [];

  User({
    required this.email,
    required this.fullName,
    required this.birthDay,
    required this.country,
    required this.level,
    required this.topicToLearn,
    required this.bookingHistory,
    required this.sessionHistory,
    this.phone = "",
  });

  List<Booking> getUpcomming() {
    return bookingHistory.where((booking) => booking.isCancelled == false).toList();
  }
}
