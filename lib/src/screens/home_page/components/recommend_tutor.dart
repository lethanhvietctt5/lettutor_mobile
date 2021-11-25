import 'package:flutter/cupertino.dart';
import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/screens/home_page/components/card_tutor.dart';

class RecommendTutors {
  List<Widget> tutors = [];

  RecommendTutors() {
    List<Tutor> sampleTutors = TutorsSample.tutors.sublist(0, 4);
    for (int i = 0; i < sampleTutors.length; i++) {
      tutors.add(CardTutor(
        name: sampleTutors[i].fullName,
        sourceImage: sampleTutors[i].image,
        intro: sampleTutors[i].intro,
        languages: sampleTutors[i].languages,
      ));
    }
  }
}
