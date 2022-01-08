import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/screens/course/course.dart';
import 'package:lettutor_mobile/src/screens/courses_search_page/book_detail.dart';
import 'package:lettutor_mobile/src/screens/feedback_page.dart/feedback_page.dart';
import 'package:lettutor_mobile/src/screens/lesson/lesson.dart';
import 'package:lettutor_mobile/src/screens/login_page/forgot_pass.dart';
import 'package:lettutor_mobile/src/screens/login_page/login.dart';
import 'package:lettutor_mobile/src/screens/profile_page/profile_page.dart';
import 'package:lettutor_mobile/src/screens/setting_page/advanced_setting/advanced_setting.dart';
import 'package:lettutor_mobile/src/screens/setting_page/change_password/change_password.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/record_video.dart';
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
const String sessionHistoryPage = 'sessionHistory';
const String advancedSettingPage = 'advancedSetting';
const String feedbackPage = 'feedback';
const String bookDetailPage = 'bookDetail';
const String changePasswordPage = 'changePassword';
const String recordVideoPage = 'recordVideo';

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
    case sessionHistoryPage:
      return MaterialPageRoute(builder: (context) => const SessionHistoryPage());
    case advancedSettingPage:
      return MaterialPageRoute(builder: (context) => const AdvancedSettingPage());
    case bookDetailPage:
      return MaterialPageRoute(builder: (context) => const BookDetail());
    case changePasswordPage:
      return MaterialPageRoute(builder: (context) => const ChangePasswordPage());
    case recordVideoPage:
      return MaterialPageRoute(builder: (context) {
        Map<String, String> arg = settings.arguments as Map<String, String>;
        return RecordVideo(url: arg['url'] as String);
      });

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
        Map<String, BookingInfo> arg = settings.arguments as Map<String, BookingInfo>;
        return FeedbackPage(bookingInfo: arg["bookingInfo"] as BookingInfo);
      });

    default:
      return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}
