import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor_mobile/src/constants/learning_topics.dart';
import 'package:lettutor_mobile/src/constants/list_languages.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';
import 'package:lettutor_mobile/src/models/tutor_model/tutor_model.dart';
import 'package:lettutor_mobile/src/models/user_model/feedback_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/booking_feature.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/course_card.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/infor_chip.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/main_info.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/components/rate_comment.dart';
import 'package:lettutor_mobile/src/services/tutor_service.dart';
import 'package:provider/provider.dart';

class TutorProfile extends StatefulWidget {
  const TutorProfile({Key? key, required this.tutorID}) : super(key: key);
  final String tutorID;

  @override
  State<TutorProfile> createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  bool isLoading = true;
  Tutor? tutor;

  void fetchTutor(String token) async {
    final tutor = await TutorService.getTutor(widget.tutorID, token);

    setState(() {
      this.tutor = tutor;
      isLoading = false;
    });
  }

  renderFeedbacks() {
    if (tutor!.user.feedbacks != null) {
      return ListView.builder(
        itemCount: tutor!.user.feedbacks?.length,
        itemBuilder: (context, index) {
          return RateAndComment(feedback: tutor!.user.feedbacks?[index] as FeedBack);
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.tokens != null && isLoading) {
      fetchTutor(authProvider.tokens?.access.token as String);
    }
    final List<Course> courses = [];

    if (tutor == null) {
      return const SafeArea(child: Scaffold(body: Center(child: CircularProgressIndicator())));
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
              MainInfo(tutor: tutor as Tutor),
              //BookingFeature(tutor: tutor as Tutor),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(tutor!.bio, style: const TextStyle(fontSize: 13)),
              ),
              InforChips(
                  title: "Languages",
                  chips: listLanguages.entries
                      .where((element) => tutor!.languages.split(",").contains(element.key))
                      .map((e) => e.value["name"] as String)
                      .toList()),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Interests",
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        (tutor?.interests as String).trim(),
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
              InforChips(
                  title: "Specialties",
                  chips: listLearningTopics.entries
                      .where((element) => tutor!.specialties.split(",").contains(element.key))
                      .map((e) => e.value)
                      .toList()),
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
              renderFeedbacks(),
            ],
          ),
        ),
      ),
    ));
  }
}
