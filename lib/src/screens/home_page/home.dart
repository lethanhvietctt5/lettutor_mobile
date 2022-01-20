import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor_model/tutor_model.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:lettutor_mobile/src/global_state/auth_provider.dart';
import 'package:lettutor_mobile/src/global_state/navigation_index.dart';
import 'package:lettutor_mobile/src/screens/home_page/components/banner.dart';
import 'package:lettutor_mobile/src/screens/home_page/components/card_tutor.dart';
import 'package:lettutor_mobile/src/services/tutor_service.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tutor> _tutors = [];
  bool _isLoading = true;

  void fetchRecommendTutors(String token, AppProvider appProvider) async {
    final allTopics = await UserService.fetchAllLearningTopic(token);
    final allTestPreparation = await UserService.fetchAllTestPreparation(token);
    appProvider.load(allTopics, allTestPreparation);
    final result = await TutorService.getListTutorWithPagination(1, 9, token);
    final List<Tutor> listTutors = [];

    for (int i = 0; i < result.length; i++) {
      final tutorDetail = await TutorService.getTutor(result[i].userId, token);
      listTutors.add(tutorDetail);
    }

    if (mounted) {
      setState(() {
        _tutors = listTutors;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationIndex = Provider.of<NavigationIndex>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.language;

    if (_isLoading && authProvider.tokens != null) {
      fetchRecommendTutors(authProvider.tokens?.access.token as String, appProvider);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const BannerHomePage(),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      lang.recommendTutor,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigationIndex.index = 3;
                  },
                  child: Row(
                    children: [
                      Text(
                        lang.seeAll,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      SvgPicture.asset(
                        "asset/svg/ic_next.svg",
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                    itemCount: _tutors.length,
                    itemBuilder: (context, index) => CardTutor(tutor: _tutors[index]),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
        ],
      ),
    );
  }
}
