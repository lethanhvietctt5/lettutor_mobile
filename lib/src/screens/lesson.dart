import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  Timer? _timerInRoom;
  Timer? _timerToStart;

  int _countTimeInRoom = 0;
  int _countTimeToStart = 15 * 60 * 60;

  void increase(timer) {
    setState(() {
      _countTimeInRoom++;
    });
  }

  void descrease(timer) {
    setState(() {
      if (_countTimeToStart > 0) {
        _countTimeToStart--;
      }
    });
  }

  String stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours <= 0) return "$twoDigitMinutes : $twoDigitSeconds";
    return "${twoDigits(duration.inHours)} : $twoDigitMinutes : $twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    _timerInRoom = Timer.periodic(const Duration(seconds: 1), (timer) {
      increase(timer);
    });

    _timerToStart = Timer.periodic(const Duration(seconds: 1), (timer) {
      descrease(timer);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timerInRoom?.cancel();
    _timerToStart?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ));
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Tutorial Meeting Room ${stringDuration(Duration(seconds: _countTimeInRoom))}",
                    style: TextStyle(color: Colors.grey[100], fontSize: 13),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey[800]),
                  child: Column(
                    children: [
                      const Text(
                        "Lesson will be started after",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(stringDuration(Duration(seconds: _countTimeToStart)),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22, wordSpacing: 10, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "You are the only one in the meeting",
                    style: TextStyle(color: Colors.grey[100], fontSize: 13),
                  ),
                ),
              ],
            ),
          )),
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 25,
                  child: SvgPicture.asset(
                    "asset/svg/ic_micro_on.svg",
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  width: 25,
                  child: SvgPicture.asset(
                    "asset/svg/ic_video_off.svg",
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  width: 25,
                  child: SvgPicture.asset(
                    "asset/svg/ic_message3.svg",
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  width: 25,
                  child: SvgPicture.asset(
                    "asset/svg/ic_share_screen.svg",
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(
                  width: 25,
                  child: SvgPicture.asset(
                    "asset/svg/ic_three_dot.svg",
                    color: Colors.grey[100],
                  ),
                ),
                InkWell(
                  onTap: () {
                    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white,
                    ));
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red),
                    child: SizedBox(
                      width: 25,
                      child: SvgPicture.asset(
                        "asset/svg/ic_phone.svg",
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
