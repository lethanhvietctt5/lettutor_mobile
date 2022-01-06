import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/book/book.dart';
import 'package:lettutor_mobile/src/models/course_model/course_category.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class BookTab extends StatefulWidget {
  const BookTab({Key? key}) : super(key: key);

  @override
  State<BookTab> createState() => _BookTabState();
}

class _BookTabState extends State<BookTab> {
  final List<Book> _results = [];
  final TextEditingController _controller = TextEditingController();

  // * Debounce timer for search performance
  Timer? _debounce;

  List<Widget> _generateChips(List<CourseCategory> categories) {
    return categories
        .map(
          (chip) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 5, right: 8),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                chip.title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.grey[400] as Color),
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

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    if (_controller.text.isEmpty) {
      // setState(() {
      //   _results = BooksSample.books;
      // });
    }

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
                // List<Book> newResults = [];
                // for (int i = 0; i < res.length; i++) {
                //   if (res[i].score >= 0.3) {
                //     newResults.add(BooksSample.books.firstWhere((book) => book.name == res[i].text));
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
                hintText: "Search books..."),
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
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routes.bookDetailPage);
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
                                  _results[index].img,
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
                                      Text(
                                        _results[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8, bottom: 15),
                                        child: Text(
                                          _results[index].description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                                        ),
                                      ),
                                      Text(
                                        _results[index].level,
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
                    );
                  },
                ),
        ),
      ],
    );
  }
}
