import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:provider/provider.dart';

class BannerHomePage extends StatefulWidget {
  const BannerHomePage({Key? key}) : super(key: key);

  @override
  State<BannerHomePage> createState() => _BannerHomePageState();
}

class _BannerHomePageState extends State<BannerHomePage> {
  Duration? totalLessonTime;
  BookingInfo? nextlesson;
  int? timeStamp;
  bool isLoading = true;

  void fetchTotalLessonTime(String token) async {
    final res = await UserService.getTotalHourLesson(token);
    final next = await UserService.fetchNextLesson(token);
    if (res != null && mounted) {
      setState(() {
        timeStamp = res;
        nextlesson = next;
        totalLessonTime = Duration(minutes: res);
        isLoading = false;
      });
    }

    // ! Show Error if fetching failed
  }

  @override
  Widget build(BuildContext context) {
    final navigationIndex = Provider.of<NavigationIndex>(context);

    final authProvider = Provider.of<AuthProvider>(context);

    if (isLoading) {
      fetchTotalLessonTime(authProvider.tokens!.access.token);

      return const Center(
        child: CircularProgressIndicator(),
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
            timeStamp != 0 && totalLessonTime != null
                ? "Total lesson time is ${covertTotalTime(totalLessonTime as Duration)} "
                : "Wellcome to Lettutor",
            style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          nextlesson != null
              ? Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: const Text(
                    "Upcomming lession",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                )
              : Container(),
          Text(
            nextlesson != null
                ? DateFormat.yMEd().format(
                        DateTime.fromMillisecondsSinceEpoch(nextlesson!.scheduleDetailInfo!.startPeriodTimestamp)) +
                    " " +
                    DateFormat('HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(nextlesson!.scheduleDetailInfo!.startPeriodTimestamp)) +
                    " - " +
                    DateFormat('HH:mm')
                        .format(DateTime.fromMillisecondsSinceEpoch(nextlesson!.scheduleDetailInfo!.endPeriodTimestamp))
                : "",
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () async {
                if (nextlesson != null) {
                  final base64Decoded =
                      base64.decode(base64.normalize(nextlesson!.studentMeetingLink.split("token=")[1].split(".")[1]));
                  final urlObject = utf8.decode(base64Decoded);
                  final jsonRes = json.decode(urlObject);
                  final String roomId = jsonRes['room'];
                  final String domainUrl = jsonRes["sub"];
                  final String tokenMeeting = nextlesson!.studentMeetingLink.split("token=")[1];

                  final options = JitsiMeetingOptions(room: roomId)
                    ..serverURL = "https://meet.lettutor.com"
                    ..audioOnly = true
                    ..audioMuted = true
                    ..token = tokenMeeting
                    ..videoMuted = true;

                  await JitsiMeet.joinMeeting(options);
                } else {
                  navigationIndex.index = 3;
                }
              },
              child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    nextlesson != null ? "Enter lesson room" : "Book a lesson",
                    style: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
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
