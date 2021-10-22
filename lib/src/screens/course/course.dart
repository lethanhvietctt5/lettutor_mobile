import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/course/about.dart';
import 'package:lettutor_mobile/src/screens/course/banner.dart';
import 'package:lettutor_mobile/src/screens/course/topic.dart';

class Course extends StatelessWidget {
  const Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              BannerCourse(),
              AboutCourse(),
              TopicCourse(),
            ],
          ),
        ),
      ),
    );
  }
}
