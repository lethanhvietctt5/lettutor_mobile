import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';
import 'package:lettutor_mobile/src/screens/course/components/about.dart';
import 'package:lettutor_mobile/src/screens/course/components/banner.dart';
import 'package:lettutor_mobile/src/screens/course/components/topic.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerCourse(course: course),
              AboutCourse(course: course),
              TopicCourse(course: course),
            ],
          ),
        ),
      ),
    );
  }
}
