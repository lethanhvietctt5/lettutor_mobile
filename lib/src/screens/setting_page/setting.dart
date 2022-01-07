import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/screens/setting_page/setting_btn.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
    final userAuth = authProvider.userLoggedIn;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: CachedNetworkImage(
                            imageUrl: userAuth.avatar,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          userAuth.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        userAuth.email,
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
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
                  icon: "asset/svg/ic_password2.svg",
                  title: "Change password",
                  routeName: routes.changePasswordPage,
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
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1000))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
