import 'package:lettutor_mobile/src/models/tutor/schedule.dart';

class Tutor {
  String id;
  String fullName;
  String country;
  int rate;
  String intro;
  String image;
  List<String> languages;
  Map<String, String> details;
  List<String> specialties;
  List<Schedule> dateAvailable;

  Tutor(
    this.id,
    this.fullName,
    this.country,
    this.rate,
    this.intro,
    this.image,
    this.languages,
    this.details,
    this.specialties,
    this.dateAvailable,
  );

  void setReserved(String id, bool reserved) {
    for (var i = 0; i < dateAvailable.length; i++) {
      if (dateAvailable[i].id == id) {
        dateAvailable[i].isReserved = reserved;
      }
    }
  }
}
