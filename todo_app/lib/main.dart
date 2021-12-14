import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/db/db_helper.dart';
import 'package:todo_app/screens/splash_screen.dart';
import 'package:todo_app/services/theme_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init();
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
      themeMode: ThemeServices().themeMode,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const SplashScreen(),
    );
  }
}
