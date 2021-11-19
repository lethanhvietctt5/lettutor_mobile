import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';

class RateAndComment extends StatelessWidget {
  const RateAndComment({Key? key, required String source, required String name, required String time, String comment = ""})
      : _source = source,
        _name = name,
        _time = time,
        _comment = comment,
        super(key: key);

  final String _source, _name, _time;
  final String _comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: const EdgeInsets.only(right: 10), child: AvatarCircle(width: 40, height: 40, source: _source)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _name,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const RateStars()
                    ],
                  ),
                ),
              ],
            ),
            Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: _comment.isNotEmpty ? Text(_comment) : null),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _time,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
