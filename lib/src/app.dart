import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lettutor_mobile/src/screens/home/home.dart';
import 'package:lettutor_mobile/src/screens/login/login.dart';
import 'package:lettutor_mobile/src/screens/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: HomePage()));
  }
}
