import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettutor_mobile/src/screens/home/recommend_tutor.dart';
import 'package:lettutor_mobile/src/screens/home/home.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/menu_item.dart';
import 'package:lettutor_mobile/src/screens/message/message.dart';
import 'package:lettutor_mobile/src/screens/setting/setting.dart';
import 'package:lettutor_mobile/src/screens/tutors/tutors.dart';
import 'package:lettutor_mobile/src/screens/upcoming/upcoming.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<String> titles = ["Home", "Message", "Upcoming", "Tutors", "Setting"];
  List<Widget> pages = [
    const HomePage(),
    const MessagePage(),
    const UpcomingPage(),
    const TutorsPage(),
    const SettingPage()
  ];

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _generateAppBar() {
    if (_selectedIndex == 0) {
      return Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello, Viet",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            const AvatarCircle(width: 25, height: 25, source: "asset/img/profile.jpg")
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titles[_selectedIndex],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_generateAppBar(), pages[_selectedIndex]],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          elevation: 20,
          currentIndex: _selectedIndex,
          items: [
            const MenuItem(sourceIcon: "asset/svg/ic_home.svg", label: "Home")
                .generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_message.svg", label: "Message")
                .generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_upcoming.svg", label: "Upcoming")
                .generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_tutor.svg", label: "Tutors")
                .generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_setting.svg", label: "Setting")
                .generateItem(context),
          ],
        ),
      ),
    );
  }
}
