import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/screens/setting_page/setting_btn.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final naviationIndex = Provider.of<NavigationIndex>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 25),
                      child: const AvatarCircle(width: 70, height: 70, source: "asset/img/profile.jpg")),
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
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: const <Widget>[
                SettingButton(
                  icon: "asset/svg/ic_list.svg",
                  title: "Booking History",
                  routeName: routes.bookingHistoryPage,
                ),
                SettingButton(
                  icon: "asset/svg/ic_history.svg",
                  title: "Session History",
                  routeName: routes.sessionHistoryPage,
                ),
                SettingButton(
                  icon: "asset/svg/ic_setting2.svg",
                  title: "Advanced Settings",
                  routeName: routes.advancedSettingPage,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: const [
                    SettingButton(
                      icon: "asset/svg/ic_network.svg",
                      title: "Our Website",
                      routeName: routes.loginPage,
                    ),
                    SettingButton(
                      icon: "asset/svg/ic_facebook2.svg",
                      title: "Facebook",
                      routeName: routes.loginPage,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    routes.loginPage,
                    (Route<dynamic> route) => false,
                  );
                  naviationIndex.index = 0;
                },
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
                  primary: const Color(0xff007CFF),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
