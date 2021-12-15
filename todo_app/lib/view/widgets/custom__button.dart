import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.height,
      required this.width})
      : super(key: key);

  final String label;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.isDarkMode ? orangeClr : blueClr),
      child: TextButton(
        child: Text(
          label,
          style: titleStyle,
        ),
        onPressed: onTap,
      ),
    );
  }
}
