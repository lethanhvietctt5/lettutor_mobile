import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/setting/setting_btn.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("asset/img/profile.jpg")),
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Le Thanh Viet",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Text(
                      "lethanhviet7c@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: const <Widget>[
              SettingButton(icon: "asset/svg/ic_user.svg", title: "View Feedbacks"),
              SettingButton(icon: "asset/svg/ic_list.svg", title: "Booking History"),
              SettingButton(icon: "asset/svg/ic_history.svg", title: "Session History"),
              SettingButton(icon: "asset/svg/ic_setting2.svg", title: "Advanced Settings"),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: const [
                  SettingButton(icon: "asset/svg/ic_network.svg", title: "Our Website"),
                  SettingButton(icon: "asset/svg/ic_facebook2.svg", title: "Facebook"),
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.only(top: 13, bottom: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1000))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
