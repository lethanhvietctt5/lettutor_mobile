import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({Key? key, required this.course}) : super(key: key);

  final Course course;

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
            course.about,
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
          ListView.builder(
            itemCount: course.overview.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              String key = course.overview.keys.elementAt(index);
              return Column(
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
                        child: Text(
                          key,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    course.overview[key] as String,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                ],
              );
            },
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
            course.level,
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
