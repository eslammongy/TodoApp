import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const SplashScreen(),
    );
  }
}
