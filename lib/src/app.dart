import 'package:flutter/material.dart';
import 'package:flutter_application_4/src/global.dart';
import 'package:flutter_application_4/src/pages/home/home.dart';
import 'package:flutter_application_4/src/pages/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sharedPreferences.getBool('isLoggedIn') != null
          ? const HomePage()
          : const SplashScreen(),
    );
  }
}
