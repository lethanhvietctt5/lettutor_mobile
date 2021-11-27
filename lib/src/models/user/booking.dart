import 'package:lettutor_mobile/src/models/tutor/tutor.dart';

class Booking {
  String id;
  Tutor tutor;
  DateTime start;
  DateTime end;

  Booking({
    required this.id,
    required this.tutor,
    required this.start,
    required this.end,
  });
}
