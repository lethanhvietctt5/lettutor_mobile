import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/data/course_sample.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/course_tab.dart';

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
                  const CourseTab(),
                  SingleChildScrollView(
                    child: Column(
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
                                hintText: "Search books..."),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/course");
                          },
                          child: Card(
                            elevation: 8,
                            child: SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "asset/img/book_cover.jpeg",
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Let's go starter",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 8, bottom: 15),
                                          child: Text(
                                            "For kids who start learning English the first time or speak a little English only.",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                                          ),
                                        ),
                                        Text(
                                          "Beginner",
                                          style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
