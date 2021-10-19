import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/upcoming/card_coming.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  Widget singleCard = const UpComingCard(
    imgSource: "asset/img/profile.jpg",
    date: "2021-10-06",
    name: "Lê Thành Việt",
    start: "6:00",
    end: "7:00",
  );
  final List<Widget> _samples = [];

  void _initSample() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        _samples.add(singleCard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _initSample();
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: ListView.builder(
          itemCount: _samples.length,
          itemBuilder: (context, index) {
            return _samples[index];
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics()),
    );
  }
}
