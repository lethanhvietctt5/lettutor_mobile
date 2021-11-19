import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoursesSearchPage extends StatefulWidget {
  const CoursesSearchPage({Key? key}) : super(key: key);

  @override
  _CoursesSearchPageState createState() => _CoursesSearchPageState();
}

class _CoursesSearchPageState extends State<CoursesSearchPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          "asset/svg/ic_course.svg",
                          width: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Courses",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          "asset/svg/ic_books.svg",
                          width: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Books",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
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
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: "Search courses..."),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
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
                            hintText: "Search books...")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
