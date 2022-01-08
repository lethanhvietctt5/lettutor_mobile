import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp(),
  );
}
