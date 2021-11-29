import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/screens/course/course.dart';
import 'package:lettutor_mobile/src/screens/lesson/lesson.dart';
import 'package:lettutor_mobile/src/screens/login_page/login.dart';
import 'package:lettutor_mobile/src/screens/profile_page/profile_page.dart';
import 'package:lettutor_mobile/src/screens/setting_page/advanced_setting/advanced_setting.dart';
import 'package:lettutor_mobile/src/screens/setting_page/booking_history/booking_history.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/session_history.dart';
import 'package:lettutor_mobile/src/screens/signup_page/signup.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/tutor_profile.dart';

const String loginPage = 'login';
const String registerPage = 'register';
const String homePage = 'home';
const String profilePage = 'profile';
const String tutorProfilePage = 'tutorProfile';
const String coursePage = 'course';
const String lessonPage = 'lesson';
const String bookingHistoryPage = 'bookingHistory';
const String sessionHistoryPage = 'sessionHistory';
const String advancedSettingPage = 'advancedSetting';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case tutorProfilePage:
      return MaterialPageRoute(builder: (context) {
        Map<String, Tutor> arg = settings.arguments as Map<String, Tutor>;
        return TutorProfile(tutor: arg["tutor"] as Tutor);
      });
    case coursePage:
      return MaterialPageRoute(builder: (context) {
        Map<String, Course> arg = settings.arguments as Map<String, Course>;
        return CoursePage(course: arg["course"] as Course);
      });

    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const NavigationBar());
    case profilePage:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    case lessonPage:
      return MaterialPageRoute(builder: (context) => const LessonPage());
    case bookingHistoryPage:
      return MaterialPageRoute(builder: (context) => const BookingHistoryPage());
    case sessionHistoryPage:
      return MaterialPageRoute(builder: (context) => const SessionHistoryPage());
    case advancedSettingPage:
      return MaterialPageRoute(builder: (context) => const AdvancedSettingPage());
    default:
      return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}
