import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key, required String title, required String source, required String level, required int lesson})
      : _title = title,
        _source = source,
        _lesson = lesson,
        _level = level,
        super(key: key);

  final String _title, _source, _level;
  final int _lesson;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/course");
      },
      child: Card(
        elevation: 8,
        child: SizedBox(
          width: 200,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                _source,
                height: 130,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    Text(
                      _title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _level,
                            style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                          ),
                          Text(
                            "$_lesson Lessons",
                            style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
