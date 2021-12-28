import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettutor_mobile/src/constants/colors_app.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/courses.dart';
import 'package:lettutor_mobile/src/screens/home_page/home.dart';
import 'package:lettutor_mobile/src/widgets/menu_item.dart';
import 'package:lettutor_mobile/src/screens/setting_page/setting.dart';
import 'package:lettutor_mobile/src/screens/tutors_search_page/tutors.dart';
import 'package:lettutor_mobile/src/screens/upcoming_page/upcoming.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

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

  @override
  Widget build(BuildContext context) {
    final navigationIndex = Provider.of<NavigationIndex>(context);
    final uploadImage = Provider.of<UserProvider>(context).uploadImage;
    final authUser = Provider.of<AuthProvider>(context).userLoggedIn;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text(
            titles[navigationIndex.index],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: navigationIndex.index == 0
              ? [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          routes.profilePage,
                        );
                      },
                      child: authUser != null
                          ? CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  authUser.avatar,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : CircleAvatar(
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
        body: pages[navigationIndex.index],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (int value) {
            navigationIndex.index = value;
          },
          elevation: 20,
          currentIndex: navigationIndex.index,
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
