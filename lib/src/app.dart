import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lettutor_mobile/src/models/course/course.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/course/course.dart';
import 'package:lettutor_mobile/src/screens/lesson/lesson.dart';
import 'package:lettutor_mobile/src/screens/login_page/login.dart';
import 'package:lettutor_mobile/src/screens/profile_page/profile_page.dart';
import 'package:lettutor_mobile/src/screens/setting_page/advanced_setting/advanced_setting.dart';
import 'package:lettutor_mobile/src/screens/setting_page/booking_history/booking_history.dart';
import 'package:lettutor_mobile/src/screens/setting_page/feedbacks/feedbacks.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/session_history.dart';
import 'package:lettutor_mobile/src/screens/signup_page/signup.dart';
import 'package:lettutor_mobile/src/screens/tutor_profile/tutor_profile.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/tutorProfile":
              return MaterialPageRoute(builder: (context) {
                Map<String, Tutor> arg = settings.arguments as Map<String, Tutor>;
                return TutorProfile(tutor: arg["tutor"] as Tutor);
              });
            case "/course":
              return MaterialPageRoute(builder: (context) {
                Map<String, Course> arg = settings.arguments as Map<String, Course>;
                return CoursePage(course: arg["course"] as Course);
              });

            case "/login":
              return MaterialPageRoute(builder: (context) => const LoginPage());
            case "/register":
              return MaterialPageRoute(builder: (context) => const SignUpPage());
            case "/home":
              return MaterialPageRoute(builder: (context) => const NavigationBar());
            case "/profile":
              return MaterialPageRoute(builder: (context) => const ProfilePage());
            case "/lesson":
              return MaterialPageRoute(builder: (context) => const LessonPage());
            case "/feedbacks":
              return MaterialPageRoute(builder: (context) => const FeedbacksPage());
            case "/bookingHistory":
              return MaterialPageRoute(builder: (context) => const BookingHistoryPage());
            case "/sessionHistory":
              return MaterialPageRoute(builder: (context) => const SessionHistoryPage());
            case "/advancedSettings":
              return MaterialPageRoute(builder: (context) => const AdvancedSettingPage());
            default:
              return MaterialPageRoute(builder: (context) => const LoginPage());
          }
        },
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, primaryColor: const Color(0xff007CFF)),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: NavigationBar(),
        ),
      ),
    );
  }
}
