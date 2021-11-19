import 'package:flutter/material.dart';

class TopicCourse extends StatelessWidget {
  const TopicCourse({Key? key}) : super(key: key);

  static const List<String> _topicName = [
    "Foods You Love",
    "Your Job",
    "Playing and Watching Sports",
    "The Best Pet",
    "Having Fun in Your Free Time",
    "Your Daily Routine",
    "Childhood Memories",
    "Your Family Members",
    "Your Hometown",
    "Shopping Habits",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Text(
              "Topic",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 10,
              child: Container(
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
                        _topicName[index],
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