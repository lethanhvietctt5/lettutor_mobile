import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutor_profile/tutor_profile.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';

class CardTutor extends StatelessWidget {
  const CardTutor({Key? key, required String name, required String sourceImage, required String intro})
      : _name = name,
        _sourceImage = sourceImage,
        _intro = intro,
        super(key: key);

  final String _name;
  final String _sourceImage;
  final String _intro;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorProfile()));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            //constraints: const BoxConstraints(maxHeight: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: AvatarCircle(width: 70, height: 70, source: _sourceImage)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                _name,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const RateStars(),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 5, right: 8),
                                  padding: const EdgeInsets.all(5),
                                  child: const Text(
                                    "English",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(color: Colors.blue)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5, right: 8),
                                  padding: const EdgeInsets.all(5),
                                  child: const Text(
                                    "Tagalog",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(color: Colors.blue)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "asset/svg/ic_heart.svg",
                      width: 30,
                      height: 30,
                      color: Colors.blue,
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      _intro,
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
