import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lettutor_mobile/src/navigation.dart';
import 'package:lettutor_mobile/src/screens/lesson.dart';
import 'package:lettutor_mobile/src/screens/login/login.dart';
import 'package:lettutor_mobile/src/screens/message/mess_area.dart';
import 'package:lettutor_mobile/src/screens/setting/advanced_setting/advanced_setting.dart';
import 'package:lettutor_mobile/src/screens/setting/booking_history/booking_history.dart';
import 'package:lettutor_mobile/src/screens/setting/feedbacks/feedbacks.dart';
import 'package:lettutor_mobile/src/screens/setting/session_history/session_history.dart';
import 'package:lettutor_mobile/src/screens/signup.dart';
import 'package:lettutor_mobile/src/screens/tutors/tutor_profile/tutor_profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/tutorProfile":
              return MaterialPageRoute(builder: (context) => const TutorProfile());
            case "/messageDetail":
              return MaterialPageRoute(builder: (context) => const MessageArea());
            case "/login":
              return MaterialPageRoute(builder: (context) => const LoginPage());
            case "/register":
              return MaterialPageRoute(builder: (context) => const SignUpPage());
            case "/home":
              return MaterialPageRoute(builder: (context) => const NavigationBar());
            case "/lesson":
              return MaterialPageRoute(builder: (context) => const LessonPage());
            case "/feedbacks":
              return MaterialPageRoute(builder: (context) => const Feedbacks());
            case "/bookingHistory":
              return MaterialPageRoute(builder: (context) => const BookingHistory());
            case "/sessionHistory":
              return MaterialPageRoute(builder: (context) => const SessionHistory());
            case "/advancedSettings":
              return MaterialPageRoute(builder: (context) => const AdvancedSetting());
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
            child: LoginPage()));
  }
}
