import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/constants/learning_topics.dart';
import 'package:lettutor_mobile/src/models/tutor_model/tutor_info_model.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class CardTutor extends StatelessWidget {
  const CardTutor({Key? key, required this.tutor}) : super(key: key);
  final TutorInfo tutor;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final exists = userProvider.idFavorite.where((element) => element == tutor.id);
    final _specialties = listLearningTopics.entries
        .where((element) => tutor.specialties.split(",").contains(element.key))
        .map((e) => e.value)
        .toList();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            routes.tutorProfilePage,
            arguments: {"tutorID": tutor.userId},
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 10),
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(
                          tutor.avatar as String,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      )),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        tutor.name,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const RateStars(count: 5),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (exists.isNotEmpty) {
                                    userProvider.removeFavorite(tutor.id);
                                  } else {
                                    userProvider.addFavorite(tutor.id);
                                  }
                                },
                                child: exists.isEmpty
                                    ? SvgPicture.asset(
                                        "asset/svg/ic_heart.svg",
                                        width: 35,
                                        height: 35,
                                        color: Colors.blue,
                                      )
                                    : SvgPicture.asset(
                                        "asset/svg/ic_heart_fill.svg",
                                        width: 35,
                                        height: 35,
                                        color: Colors.pink,
                                      ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              itemCount: _specialties.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 5, right: 8),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    _specialties[index],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 0.2,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      tutor.bio,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
