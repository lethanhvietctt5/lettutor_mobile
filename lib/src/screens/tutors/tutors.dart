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
        children: const <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       SvgPicture.asset("asset/svg/ic_search.svg"),
          //       TextField(
          //           textAlignVertical: TextAlignVertical.center,
          //           style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          //           decoration: InputDecoration(
          //               contentPadding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
          //               filled: true,
          //               fillColor: Colors.grey.shade200,
          //               border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
          //               hintText: "Search")),
          //     ],
          //   ),
          // ),
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
