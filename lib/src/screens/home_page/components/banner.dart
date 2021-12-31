import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class BannerHomePage extends StatefulWidget {
  const BannerHomePage({Key? key}) : super(key: key);

  @override
  State<BannerHomePage> createState() => _BannerHomePageState();
}

class _BannerHomePageState extends State<BannerHomePage> {
  Duration? totalLessonTime;
  int? timeStamp;
  bool isLoading = true;

  void fetchTotalLessonTime(String token) async {
    final res = await UserService.getTotalHourLesson(token);
    if (res != null && mounted) {
      setState(() {
        timeStamp = res;
        totalLessonTime = Duration(minutes: res);
        isLoading = false;
      });
    }

    // ! Show Error if fetching failed
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).user;
    final navigationIndex = Provider.of<NavigationIndex>(context);
    final upcomming = userProvider.getUpcomming();

    final authProvider = Provider.of<AuthProvider>(context);

    if (isLoading) {
      fetchTotalLessonTime(authProvider.tokens!.access.token);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff0040D6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timeStamp != 0 && totalLessonTime != null
                ? "Total lesson time is ${covertTotalTime(totalLessonTime as Duration)} "
                : "Wellcome to Lettutor",
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

String stringFormatUpcomming(DateTime? s, DateTime? e) {
  if (s == null || e == null) {
    return "";
  }
  return DateFormat.yMEd().format(s) + " " + DateFormat.jm().format(s) + " - " + DateFormat.jm().format(e);
}

String covertTotalTime(Duration d) {
  String res = "";
  Duration total = d;
  if (d.inDays > 0) {
    res += "${total.inDays} days ";
    total = total - Duration(days: total.inDays);
  }
  if (d.inHours > 0) {
    res += "${total.inHours} hours ";
    total = total - Duration(hours: total.inHours);
  }
  if (d.inMinutes > 0) {
    res += "${total.inMinutes} minutes";
    total = total - Duration(minutes: total.inMinutes);
  }

  return res;
}
