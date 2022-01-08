import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/navigation_index.dart';
import 'package:lettutor_mobile/src/provider/setting.dart';
import 'package:lettutor_mobile/src/screens/login_page/login.dart';
import 'package:provider/provider.dart';
import 'package:lettutor_mobile/src/routes/route.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationIndex(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingProvider(),
        ),  
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.controller,
        // showPerformanceOverlay: true,
        title: 'Lettutor',
        theme: ThemeData(primarySwatch: Colors.blue, primaryColor: const Color(0xff007CFF)),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: LoginPage(),
        ),
      ),
    );
  }
}
