import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/home_page/components/recommend_tutor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff0040D6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total lesson time is 11 hours 45 minutes",
                  style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: const Text(
                    "Upcomming lession",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
                const Text(
                  "Wed, 06 Oct 21 06:30 - 06:55",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/lesson");
                    },
                    child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          "Enter lesson room",
                          style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: const Text(
                      "Recommended Tutors",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              itemCount: RecommendTutors().tutors.length,
              itemBuilder: (context, index) => RecommendTutors().tutors[index],
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
