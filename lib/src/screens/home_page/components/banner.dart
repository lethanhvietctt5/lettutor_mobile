import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class BannerHomePage extends StatelessWidget {
  const BannerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).user;
    final upcomming = userProvider.getUpcomming();

    if (upcomming.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: MediaQuery.of(context).size.width,
        constraints: const BoxConstraints(minHeight: 170),
        color: const Color(0xff0040D6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Wellcome to Lettutor",
              style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  // ! NOTICE THIS IS ERROR
                  // ! ERROR
                  // ! ERROR
                  Navigator.pushNamed(context, "/lesson");
                },
                child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Text(
                      "Booking a lesson",
                      style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff0040D6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total lesson time is ${getFormatTotalTime(userProvider.getTotalLessonTime())}",
            style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            child: const Text(
              "Upcomming lession",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          Text(
            stringFormatUpcomming(userProvider.getNearestLesson()?.start, userProvider.getNearestLesson()?.end),
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, routes.lessonPage);
              },
              child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text(
                    "Enter lesson room",
                    style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                  )),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String getFormatTotalTime(int m) {
  final days = (m / 60 / 24).floor();
  final hours = (m % (60 * 24) / 60).floor();
  final minutes = m % 60;

  String res = "";

  if (days > 0) {
    res += "$days days ";
  }
  if (hours > 0) {
    res += "$hours hours ";
  }
  if (minutes > 0) {
    res += "$minutes minutes ";
  }
  return res;
}

String stringFormatUpcomming(DateTime? s, DateTime? e) {
  if (s == null || e == null) {
    return "";
  }
  return DateFormat.yMEd().format(s) + " " + DateFormat.jm().format(s) + " - " + DateFormat.jm().format(e);
}
