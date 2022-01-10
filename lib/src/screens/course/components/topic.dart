import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/course_model/course_model.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:provider/provider.dart';

class TopicCourse extends StatelessWidget {
  const TopicCourse({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<AppProvider>(context).language;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.topic,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            itemCount: course.topics.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigo[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        course.topics[index].name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
