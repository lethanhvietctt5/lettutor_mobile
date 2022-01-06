import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/screens/course/course.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/book_detail.dart';
import 'package:lettutor_mobile/src/screens/feedback_page.dart/feedback_page.dart';
import 'package:lettutor_mobile/src/screens/lesson/lesson.dart';
import 'package:lettutor_mobile/src/screens/login_page/forgot_pass.dart';
import 'package:lettutor_mobile/src/screens/login_page/login.dart';
import 'package:lettutor_mobile/src/screens/profile_page/profile_page.dart';
import 'package:lettutor_mobile/src/screens/setting_page/advanced_setting/advanced_setting.dart';
import 'package:lettutor_mobile/src/screens/setting_page/booking_history/booking_history.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/session_history.dart';
import 'package:lettutor_mobile/src/screens/register_page/register.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/tutor_profile.dart';

const String loginPage = 'login';
const String registerPage = 'register';
const String forgotPasswordPage = 'forgot_password';
const String homePage = 'home';
const String profilePage = 'profile';
const String tutorProfilePage = 'tutorProfile';
const String coursePage = 'course';
const String lessonPage = 'lesson';
const String bookingHistoryPage = 'bookingHistory';
const String sessionHistoryPage = 'sessionHistory';
const String advancedSettingPage = 'advancedSetting';
const String feedbackPage = 'feedback';
const String bookDetailPage = 'bookDetail';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case forgotPasswordPage:
      return MaterialPageRoute(builder: (context) => const ForgotPasswordPage());
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
    case bookDetailPage:
      return MaterialPageRoute(builder: (context) => const BookDetail());

    case tutorProfilePage:
      return MaterialPageRoute(builder: (context) {
        Map<String, String> arg = settings.arguments as Map<String, String>;
        return TutorProfile(tutorID: arg['tutorID'] as String);
      });

    case coursePage:
      return MaterialPageRoute(builder: (context) {
        Map<String, String> arg = settings.arguments as Map<String, String>;
        return CoursePage(courseId: arg["courseId"] as String);
      });

    case feedbackPage:
      return MaterialPageRoute(builder: (context) {
        Map<String, Tutor> arg = settings.arguments as Map<String, Tutor>;
        return FeedbackPage(tutor: arg["tutor"] as Tutor);
      });

    default:
      return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}
