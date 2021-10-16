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
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                    style: TextStyle(fontSize: 15, color: Colors.grey[900]),
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
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: "Search Tutors or Courses")),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: const Text(
                    "Recommended Tutors",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          ...RecommendTutors().tutors
        ],
      ),
    );
  }
}
