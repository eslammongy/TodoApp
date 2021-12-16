import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

AppBar buildCustomAppBar(
    {required BuildContext context,
    required String title,
    Function()? deleteTasks,
    required bool deleteVisiable,
    required Widget widget}) {
  return AppBar(
      titleSpacing: 0.0,
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: widget,
      actions: [
        deleteVisiable
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: deleteTasks,
                icon: Icon(
                  Icons.cleaning_services_rounded,
                  color: Get.isDarkMode ? orangeClr : darkGreyClr,
                  size: 25,
                ))
            : Container(),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/doings.png'),
            radius: 20,
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
      centerTitle: true,
      title: Text(
        title,
        style: headingStyle,
      ));
}
