import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor_model/tutor_info_model.dart';
import 'package:lettutor_mobile/src/models/user_model/learning_topic_model.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_item.dart';
import 'package:lettutor_mobile/src/services/tutor_service.dart';
import 'package:provider/provider.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  final TextEditingController _controller = TextEditingController();

  List<TutorInfo> _results = [];
  String specialist = "";
  Timer? _debounce;
  String search = "";
  bool isFetching = true;

  List<Widget> _generateChips(List<dynamic> chips) {
    return chips
        .map(
          (chip) => GestureDetector(
            onTap: () {
              setState(() {
                specialist = chip.key;
                isFetching = true;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5, right: 8),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                chip.name,
                style: TextStyle(
                  fontSize: 12,
                  color: chip.key == specialist ? Colors.blue[400] : Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
              decoration: BoxDecoration(
                color: chip.key == specialist ? Colors.blue[50] : Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                    color: chip.key == specialist
                        ? Colors.blue[100] as Color
                        : Colors.grey[400] as Color),
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

  void fetchTutors(int page, int size, String token) async {
    final response = await TutorService.searchTutor(
      page,
      size,
      token,
      search: search,
      specialties: [specialist],
    );
    if (mounted) {
      setState(() {
        _results = response;
        isFetching = false;
      });
    }
  }

  checkFetching(String token) {
    fetchTutors(1, 10, token);
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    List<dynamic> chips = [];
    chips.add(LearnTopic(id: 1, key: "", name: "All"));
    chips.addAll(appProvider.allLearningTopics);
    chips.addAll(appProvider.allTestPreparations);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                  style: TextStyle(fontSize: 12, color: Colors.grey[900]),
                  controller: _controller,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      setState(() {
                        search = value;
                        isFetching = true;
                      });
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Search Tutors")),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: 33,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _generateChips(chips).length,
                itemBuilder: (context, index) {
                  return _generateChips(chips)[index];
                },
                shrinkWrap: true,
              ),
            ),
            isFetching
                ? checkFetching(authProvider.tokens!.access.token)
                : _results.isEmpty
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
                          return TutorCardInfo(tutor: _results[index]);
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
          ],
        ),
      ),
    );
  }
}
