import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/home/recommend_tutor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: const Color(0xff0720AE),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text(
                "Welcome to LetTutor",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Book a lesson", style: TextStyle(color: Colors.blue)),
                style: ElevatedButton.styleFrom(primary: Colors.white, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              )
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: const Text(
                      "Recommended Tutors",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff59585A)),
                    ),
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff59585A), width: 2))),
                  ),
                  Row(
                    children: [
                      const Text(
                        "See all",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SvgPicture.asset(
                        "asset/svg/ic_next.svg",
                        color: Colors.blue,
                      )
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              ...RecommendTutors().tutors
            ],
          ),
        )
      ],
    );
  }
}
