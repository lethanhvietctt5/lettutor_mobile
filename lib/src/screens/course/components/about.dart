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
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Text(
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
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
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.help_outline,
                                color: Colors.red,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 70,
                                margin: const EdgeInsets.only(left: 10, bottom: 10),
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Text(
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
          ),
        ],
      ),
    );
  }
}
