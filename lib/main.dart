import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen") ?? 0;
  await prefs.setInt("initScreen", 1);
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),

  ]).then((value) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppDecoration.style.color, // Change this color as needed
      statusBarBrightness: Brightness.dark,
    ));

    ///Please update theme as per your need if required.
    ThemeHelper().changeTheme('primary');
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'financial_assistant',
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0
          ? AppRoutes.onboardingOneScreen
          : AppRoutes.navigationBarScreen,
      routes: AppRoutes.routes,
    );
  }
}
