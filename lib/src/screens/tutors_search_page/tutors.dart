import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_item.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  final List<String> _chips = [
    "All",
    "English for Kids",
    "Business English",
    "Conversational English",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOEFL",
    "TOEIC"
  ];

  List<Widget> _generateChips() {
    return _chips
        .map((chip) => Container(
              margin: const EdgeInsets.only(top: 5, right: 8),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                chip,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w700,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.blue[100] as Color)),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Search Tutors")),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _generateChips().length,
                itemBuilder: (context, index) {
                  return _generateChips()[index];
                },
                shrinkWrap: true,
              ),
            ),
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => const TutorCardInfo(
                    name: "Le Thanh Viet",
                    sourceImage: "asset/img/profile.jpg",
                    intro:
                        "Hello there, My name is Ralf I am a well-rounded teacher good at teaching communication classes as well as teaching younger kids. If you are a beginner or intermediate student I am here to help you learn. Hope to see you soon."),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics()),
          ],
        ),
      ),
    );
  }
}
