import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class TutorCardInfo extends StatelessWidget {
  const TutorCardInfo({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            routes.tutorProfilePage,
            arguments: {"tutor": tutor},
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: AvatarCircle(width: 70, height: 70, source: tutor.image),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    tutor.fullName,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    tutor.getTotalStar().toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SvgPicture.asset(
                                    "asset/svg/ic_star.svg",
                                    color: Colors.yellow,
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              itemCount: tutor.languages.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 5, right: 8),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    tutor.languages[index],
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
                      tutor.intro,
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
