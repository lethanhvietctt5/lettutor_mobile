import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/courses.dart';
import 'package:lettutor_mobile/src/screens/home_page/home.dart';
import 'package:lettutor_mobile/src/widgets/menu_item.dart';
import 'package:lettutor_mobile/src/screens/setting_page/setting.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutors.dart';
import 'package:lettutor_mobile/src/screens/upcoming_page/upcoming.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<String> titles = ["Home", "Courses", "Upcoming", "Tutors", "Setting"];
  List<Widget> pages = [
    const HomePage(),
    const CoursesSearchPage(),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: Text(
            titles[_selectedIndex],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: _selectedIndex == 0
              ? [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/profile");
                      },
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(
                            "asset/img/profile.jpg",
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  )
                ]
              : [],
        ),
        backgroundColor: Colors.white,
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          elevation: 20,
          currentIndex: _selectedIndex,
          items: [
            const MenuItem(sourceIcon: "asset/svg/ic_home.svg", label: "Home").generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_course.svg", label: "Courses").generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_upcoming.svg", label: "Upcoming").generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_tutor.svg", label: "Tutors").generateItem(context),
            const MenuItem(sourceIcon: "asset/svg/ic_setting.svg", label: "Setting").generateItem(context),
          ],
        ),
      ),
    );
  }
}
