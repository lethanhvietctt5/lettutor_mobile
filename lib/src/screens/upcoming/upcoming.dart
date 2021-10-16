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
  List<Widget> samples = [];

  void _initSample() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        samples.add(singleCard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _initSample();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const <Widget>[
          UpComingCard(
            imgSource: "asset/img/profile.jpg",
            date: "2021-10-06",
            name: "Lê Thành Việt",
            start: "6:00",
            end: "7:00",
          ),
          UpComingCard(
            imgSource: "asset/img/profile.jpg",
            date: "2021-10-06",
            name: "Lê Thành Việt",
            start: "6:00",
            end: "7:00",
          ),
          UpComingCard(
            imgSource: "asset/img/profile.jpg",
            date: "2021-10-06",
            name: "Lê Thành Việt",
            start: "6:00",
            end: "7:00",
          ),
          UpComingCard(
            imgSource: "asset/img/profile.jpg",
            date: "2021-10-06",
            name: "Lê Thành Việt",
            start: "6:00",
            end: "7:00",
          ),
          UpComingCard(
            imgSource: "asset/img/profile.jpg",
            date: "2021-10-06",
            name: "Lê Thành Việt",
            start: "6:00",
            end: "7:00",
          )
        ],
      ),
    );
  }
}
