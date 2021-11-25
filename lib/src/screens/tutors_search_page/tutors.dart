import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_item.dart';
import 'package:woozy_search/woozy_search.dart';

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
  final TextEditingController _controller = TextEditingController();

  List<Tutor> _results = [];

  // * Debounce timer for search performance
  Timer? _debounce;

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
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final woozy = Woozy();
    List<String> names = TutorsSample.tutors.map((tutor) => tutor.fullName).toList();
    woozy.setEntries(names);

    if (_controller.text.isEmpty) {
      setState(() {
        _results = TutorsSample.tutors;
      });
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextField(
                  style: TextStyle(fontSize: 12, color: Colors.grey[900]),
                  controller: _controller,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      final res = woozy.search(value);
                      List<Tutor> newResults = [];
                      for (int i = 0; i < res.length; i++) {
                        if (res[i].score >= 0.3) {
                          newResults.add(TutorsSample.tutors.firstWhere((tutor) => tutor.fullName == res[i].text));
                        }
                      }

                      setState(() {
                        _results = newResults;
                      });
                    });
                  },
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
              itemCount: _results.length,
              itemBuilder: (context, index) {
                Tutor tutor = _results[index];
                return TutorCardInfo(tutor: tutor);
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
