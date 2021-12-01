import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor_mobile/src/data/course_sample.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/booking_feature.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/course_card.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/infor_chip.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/main_info.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/rate_comment.dart';

class TutorProfile extends StatelessWidget {
  const TutorProfile({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    final List<Course> courses = [];
    for (Course course in CoursesSample.courses) {
      for (Tutor tutor in course.tutors) {
        if (tutor.id == this.tutor.id) {
          courses.add(course);
        }
      }
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainInfo(tutor: tutor),
              BookingFeature(tutor: tutor),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(tutor.intro, style: const TextStyle(fontSize: 13)),
              ),
              const InforChips(title: "Languages", chips: ["English", "Tagalogs"]),
              ListView.builder(
                itemCount: tutor.details.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  String key = tutor.details.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          key,
                          style: const TextStyle(fontSize: 17, color: Colors.blue),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            tutor.details[key] as String,
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const InforChips(
                  title: "Specialties",
                  chips: ["English for Business", "Conversational", "English for kids", "STARTERS", "MOVERS"]),
              courses.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 6, top: 10),
                          child: const Text(
                            "Courses",
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return CourseCard(course: courses[index]);
                            },
                          ),
                        ),
                      ],
                    )
                  : const Text(""),
              Container(
                margin: const EdgeInsets.only(bottom: 6, top: 15),
                child: const Text(
                  "Rates and Comments",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              ListView.builder(
                itemCount: tutor.feedbacks.length,
                itemBuilder: (context, index) {
                  return RateAndComment(feedback: tutor.feedbacks[index]);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
