import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/course_card.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/infor_chip.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/infor_text.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/rate_comment.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';

class TutorProfile extends StatelessWidget {
  const TutorProfile({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: AvatarCircle(width: 70, height: 70, source: tutor.image)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(tutor.fullName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                          const Text(
                            "Teacher",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            tutor.country,
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                    const RateStars(),
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 8),
                      child: SvgPicture.asset(
                        "asset/svg/ic_heart.svg",
                        width: 30,
                        height: 30,
                        color: Colors.red,
                      ),
                    )
                  ])
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Booking",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          "asset/svg/ic_message2.svg",
                          color: Colors.blue,
                        ),
                        const Text(
                          "Message",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "asset/svg/ic_report.svg",
                          color: Colors.blue,
                        ),
                        const Text(
                          "Report",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(tutor.intro, style: const TextStyle(fontSize: 13)),
              ),
              const InforChips(title: "Languages", chips: ["English", "Tagalogs"]),
              ListView.builder(
                itemCount: tutor.details.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  String key = tutor.details.keys.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
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
              Column(
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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const CourseCard(
                            title: "Basic conversation Topics",
                            source: "asset/img/course.png",
                            level: "Beginer",
                            lesson: 10);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 6, top: 15),
                child: const Text(
                  "Rates and Comments",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              const RateAndComment(
                  source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
              const RateAndComment(
                  source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
              const RateAndComment(
                  source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
            ],
          ),
        ),
      ),
    ));
  }
}
