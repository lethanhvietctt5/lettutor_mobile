import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/constants/learning_topics.dart';
import 'package:lettutor_mobile/src/models/tutor_model/tutor_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class CardTutor extends StatefulWidget {
  const CardTutor({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  State<CardTutor> createState() => _CardTutorState();
}

class _CardTutorState extends State<CardTutor> {
  late Tutor _tutor;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tutor = widget.tutor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _specialties = listLearningTopics.entries
        .where((element) => _tutor.specialties.split(",").contains(element.key))
        .map((e) => e.value)
        .toList();

    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            routes.tutorProfilePage,
            arguments: {"tutorID": _tutor.userId},
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
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: CachedNetworkImage(
                              imageUrl: _tutor.user.avatar,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                        _tutor.user.name,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    RateStars(count: _tutor.avgRating ?? 5),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final res = await UserService.addAndRemoveTutorFavorite(
                                      _tutor.userId, authProvider.tokens!.access.token);

                                  if (res) {
                                    setState(() {
                                      _tutor.isFavorite = !(_tutor.isFavorite ?? false);
                                    });
                                  }
                                },
                                child: _tutor.isFavorite != null && !(_tutor.isFavorite as bool)
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
                      _tutor.bio,
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
