import 'package:lettutor_mobile/src/models/tutor/tutor.dart';

class Upcomming {
  String id;
  Tutor tutor;
  DateTime timeStart;
  DateTime timeEnd;

  Upcomming({
    required this.id,
    required this.tutor,
    required this.timeStart,
    required this.timeEnd,
  });
}
