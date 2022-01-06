import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/course_model/course_category.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/book_tab.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/course_tab.dart';
import 'package:lettutor_mobile/src/services/course_service.dart';
import 'package:provider/provider.dart';

class CoursesSearchPage extends StatefulWidget {
  const CoursesSearchPage({Key? key}) : super(key: key);

  @override
  _CoursesSearchPageState createState() => _CoursesSearchPageState();
}

class _CoursesSearchPageState extends State<CoursesSearchPage> {
  List<CourseCategory> categories = [];

  void fetchCategories(String token) async {
    final response = await CourseService.getAllCourseCategories(token);
    if (mounted) {
      setState(() {
        categories = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    if (appProvider.allCourseCategories.isEmpty && categories.isNotEmpty) {
      appProvider.loadCourseCategories(categories);
    }

    if (appProvider.allCourseCategories.isEmpty) {
      fetchCategories(authProvider.tokens!.access.token);
    }

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
            const Expanded(
              child: TabBarView(
                children: [
                  CourseTab(),
                  BookTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
