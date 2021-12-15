import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';

Widget buildTaskBottomSheet(
    {required String label,
    required Function()? onTap,
    required Color color,
    bool isClose = false}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[100]!
                  : color),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : color),
      child: Center(
          child: Text(
        label,
        style: isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
      )),
    ),
  );
}
