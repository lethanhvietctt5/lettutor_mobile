import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/course_card.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/infor_chip.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/infor_text.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/rate_comment.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';

class TutorProfile extends StatelessWidget {
  const TutorProfile({Key? key}) : super(key: key);

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
                          child: const AvatarCircle(width: 70, height: 70, source: "asset/img/profile.jpg")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Lê Thành Việt", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                          Text(
                            "Teacher",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            "VietNam",
                            style: TextStyle(fontSize: 15),
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
                child: const Text(
                  "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners. So don't worry, I will be with you every step of the way going at your own pace. Let's practice what you already know and add something new each day. With my skills and experiences, I can assure you that I can provide adequate English learning effectively and efficiently. Together, let's make English learning fun.",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const InforChips(title: "Languages", chips: ["English", "Tagalogs"]),
                  const InforText(
                      title: "Education",
                      text:
                          "I am a license teacher I worked as an ESL Teacher for a year now, I am tutor for elementary to Senior High School student. I also teach Business English for some Professional Students ."),
                  const InforText(
                      title: "Experience", text: "I have been teaching English online since 2020 catering to Japanese and Chinese students."),
                  const InforText(title: "Interests", text: "Cooking, Mingling with kids, Watch my small retail store, Travelling"),
                  const InforText(
                      title: "Education", text: "I have been teaching English online since 2020 catering to Japanese and Chinese students."),
                  const InforChips(title: "Specialties", chips: ["English for Business", "Conversational", "English for kids", "STARTERS", "MOVERS"]),
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
                            return const CourseCard(title: "Basic conversation Topics", source: "asset/img/course.png", level: "Beginer", lesson: 10);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 6, top: 15),
                child: const Text(
                  "Rates and Comments",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              const RateAndComment(source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
              const RateAndComment(source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
              const RateAndComment(source: "asset/img/profile.jpg", name: "Nguyễn Minh Triết", time: "20:57:41, 17/10/2021"),
            ],
          ),
        ),
      ),
    ));
  }
}
