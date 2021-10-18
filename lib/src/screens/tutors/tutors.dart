import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/tutors/tutor_item.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
                style: TextStyle(fontSize: 12, color: Colors.grey[900]),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        "asset/svg/ic_search.svg",
                        color: Colors.grey[600],
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 5, right: 5),
                    border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Search Tutors")),
          ),
          const TutorCardInfo(
              name: "Le Thanh Viet",
              sourceImage: "asset/img/profile.jpg",
              intro:
                  "Hello there, My name is Ralf I am a well-rounded teacher good at teaching communication classes as well as teaching younger kids. If you are a beginner or intermediate student I am here to help you learn. Hope to see you soon."),
          const TutorCardInfo(
              name: "Le Thanh Viet",
              sourceImage: "asset/img/profile.jpg",
              intro:
                  "Hello there, My name is Ralf I am a well-rounded teacher good at teaching communication classes as well as teaching younger kids. If you are a beginner or intermediate student I am here to help you learn. Hope to see you soon."),
          const TutorCardInfo(
              name: "Le Thanh Viet",
              sourceImage: "asset/img/profile.jpg",
              intro:
                  "Hello there, My name is Ralf I am a well-rounded teacher good at teaching communication classes as well as teaching younger kids. If you are a beginner or intermediate student I am here to help you learn. Hope to see you soon."),
          const TutorCardInfo(
              name: "Le Thanh Viet",
              sourceImage: "asset/img/profile.jpg",
              intro:
                  "Hello there, My name is Ralf I am a well-rounded teacher good at teaching communication classes as well as teaching younger kids. If you are a beginner or intermediate student I am here to help you learn. Hope to see you soon.")
        ],
      ),
    );
  }
}
