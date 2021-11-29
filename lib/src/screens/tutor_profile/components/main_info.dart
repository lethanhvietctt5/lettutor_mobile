import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: AvatarCircle(width: 70, height: 70, source: tutor.image)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(tutor.fullName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const Text(
                  "Teacher",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  tutor.country,
                  style: const TextStyle(fontSize: 15),
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
    );
  }
}
