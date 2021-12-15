import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/view/widgets/custom__button.dart';

void displayDeleteDialog(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder:
          (context, Animation animation, Animation secondaryAnimation) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width * 0.10),
              vertical: MediaQuery.of(context).size.height * 0.3),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? darkGreyClr : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.cleaning_services_rounded,
                size: 50,
                color: Colors.red[800],
              ),
              SizedBox(
                height: 18,
              ),
              Material(
                color: Get.isDarkMode ? darkGreyClr : Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    "Are you sure that you want to delete all tasks",
                    textAlign: TextAlign.center,
                    style: subHeadingStyle,
                  ),
                ),
              ),
              Spacer(),
              Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                children: [
                  CustomButton(
                      label: 'Cancel',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      height: 50,
                      width: 100),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      label: 'Yes',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      height: 50,
                      width: 100)
                ],
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      });
}
