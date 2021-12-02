import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryClr,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryClr, systemNavigationBarColor: primaryClr),
      ),
      primaryColor: primaryClr,
      backgroundColor: Colors.white,
      brightness: Brightness.light);

  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: darkGreyClr,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: darkGreyClr, systemNavigationBarColor: darkGreyClr),
      ),
      primaryColor: darkGreyClr,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark);

  TextStyle get headingStyle {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 22,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w800));
  }

  TextStyle get subHeadingStyle {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 20,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w700));
  }

  TextStyle get titleStyle {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 18,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w600));
  }

  TextStyle get subTitleStyle {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black54,
            fontSize: 16,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400));
  }

  TextStyle get bodyStyle {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[200] : Colors.black54,
            fontSize: 15,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400));
  }

  TextStyle get body2Style {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: Get.isDarkMode ? Colors.grey[200] : Colors.black54,
            fontSize: 15,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400));
  }
}
