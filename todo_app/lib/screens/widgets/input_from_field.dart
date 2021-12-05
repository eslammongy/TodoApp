import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';

class CustomeInputField extends StatelessWidget {
  const CustomeInputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.textEditingController,
      this.widget})
      : super(key: key);

  final String hint;
  final String title;
  final TextEditingController? textEditingController;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Container(
              height: 55,
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1.5)),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: textEditingController,
                    autofocus: false,
                    readOnly: widget != null ? true : false,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    style: titleStyle,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0.0)),
                        hintStyle: subTitleStyle,
                        hintText: hint),
                  )),
                  widget ?? Container()
                ],
              ),
            )
          ],
        ));
  }
}
