import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor_mobile/src/models/course_model/course_model.dart';

class AboutCourse extends StatelessWidget {
  AboutCourse({Key? key, required this.course}) : super(key: key);

  final Course course;
  final listLevels = {
    "0": "Any level",
    "1": "Beginner",
    "2": "High Beginner",
    "3": "Pre-Intermediate",
    "4": "Intermediate",
    "5": "Upper-Intermediate",
    "6": "Advanced",
    "7": "Proficiency"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "About Course",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            course.description,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 0, top: 14),
            child: Text(
              "Overview",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.help_outline,
                    color: Colors.red,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: const Text(
                      "Why take this course?",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                course.reason,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.help_outline,
                    color: Colors.red,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: const Text(
                      "What will you be able to do?",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                course.purpose,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0, top: 14),
            child: Text(
              "Level",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            listLevels[course.level] ?? "Any level",
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
