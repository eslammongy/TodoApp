import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

AppBar buildCustomAppBar(
    {required BuildContext context,
    required String title,
    required Widget widget}) {
  return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: widget,
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/doings.png'),
          radius: 20,
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
