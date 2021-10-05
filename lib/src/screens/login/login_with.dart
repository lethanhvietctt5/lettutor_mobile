import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithFacebookAndGoogle extends StatelessWidget {
  const LoginWithFacebookAndGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: SvgPicture.asset(
              "asset/svg/ic_facebook.svg",
              width: 30,
              height: 30,
              color: const Color(0xff007CFF),
            ),
            style: ElevatedButton.styleFrom(shape: const CircleBorder(side: BorderSide(width: 1, color: Color(0xff007CFF))), padding: const EdgeInsets.all(5), primary: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {},
            child: SvgPicture.asset(
              "asset/svg/ic_google.svg",
              width: 30,
              height: 30,
            ),
            style: ElevatedButton.styleFrom(shape: const CircleBorder(side: BorderSide(width: 1, color: Color(0xff007CFF))), padding: const EdgeInsets.all(5), primary: Colors.white),
          )
        ],
      ),
    );
  }
}
