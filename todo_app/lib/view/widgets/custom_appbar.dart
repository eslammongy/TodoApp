import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/view/widgets/deleted_dialog.dart';

AppBar buildCustomAppBar(
    {required BuildContext context,
    required String title,
    required Widget widget}) {
  return AppBar(
      titleSpacing: 0.0,
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: widget,
      actions: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              displayDeleteDialog(context);
            },
            icon: Icon(
              Icons.delete_sweep_sharp,
              color: Get.isDarkMode ? orangeClr : darkGreyClr,
              size: 25,
            )),
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
