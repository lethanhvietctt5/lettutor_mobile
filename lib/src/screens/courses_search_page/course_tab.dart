import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/course_model/course_category.dart';
import 'package:lettutor_mobile/src/models/course_model/course_model.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/services/course_service.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class CourseTab extends StatefulWidget {
  const CourseTab({Key? key}) : super(key: key);
  @override
  State<CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTab> {
  List<Course> _results = [];
  final TextEditingController _controller = TextEditingController();
  final listLevels = {
    "0": "Any level",
    "1": "Beginner",
    "2": "High Beginner",
    "3": "Pre-Intermediate",
    "4": "Intermediate",
    "5": "Upper-Intermediate",
    "6": "Advanced",
    "7": "Proficiency"
  };
  Timer? _debounce;
  String category = "";

  List<Widget> _generateChips(List<CourseCategory> categories) {
    return categories
        .map(
          (chip) => GestureDetector(
            onTap: () {
              if (category == chip.id) {
                setState(() {
                  category = "";
                });
              } else {
                setState(() {
                  category = chip.id;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5, right: 8),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                chip.title,
                style: TextStyle(
                  fontSize: 12,
                  color: chip.id == category ? Colors.blue[400] : Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
              decoration: BoxDecoration(
                color: chip.id == category ? Colors.blue[50] : Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: chip.id == category ? Colors.blue[100] as Color : Colors.grey[400] as Color),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void fetchListCourse(int page, int size, String token) async {
    List<Course> response = await CourseService.getListCourseWithPagination(page, size, token);
    if (mounted) {
      setState(() {
        if (category.isNotEmpty) {
          response = response.where((element) => element.categories.where((e) => e.id == category).isNotEmpty).toList();
        }
        _results = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    fetchListCourse(1, 10, authProvider.tokens!.access.token);
    final appProvider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.grey[900]),
            controller: _controller,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                // final res = woozy.search(value);
                // List<Course> newResults = [];
                // for (int i = 0; i < res.length; i++) {
                //   if (res[i].score >= 0.3) {
                //     newResults.add(CoursesSample.courses.firstWhere((course) => course.title == res[i].text));
                //   }
                // }

                // setState(() {
                //   _results = newResults;
                // });
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
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: "Search courses..."),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: 33,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _generateChips(appProvider.allCourseCategories).length,
            itemBuilder: (context, index) {
              return _generateChips(appProvider.allCourseCategories)[index];
            },
            shrinkWrap: true,
          ),
        ),
        Expanded(
          child: _controller.text.isNotEmpty && _results.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "asset/svg/ic_notfound.svg",
                          width: 200,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Not found any match result...",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          routes.coursePage,
                          arguments: {"course": _results[index]},
                        );
                      },
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                        child: SizedBox(
                          // height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CachedNetworkImage(
                                imageUrl: _results[index].imageUrl,
                                // height: 210,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _results[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listLevels[_results[index].level] as String,
                                            style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                                          ),
                                          Text(
                                            _results[index].topics.length.toString() + " Lessons",
                                            style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
