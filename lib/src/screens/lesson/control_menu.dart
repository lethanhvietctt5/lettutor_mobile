import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ControlMenu extends StatelessWidget {
  const ControlMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
