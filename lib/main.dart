import 'package:flutter/material.dart';
import 'package:flutter_application_4/src/app.dart';
import 'package:flutter_application_4/src/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
