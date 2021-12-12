import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/controllers/task_controller.dart';

import '../add_new_task.dart';
import 'custom__button.dart';

Widget buildTaskBar(
    {required DateTime selectedDate, required TaskController taskController}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(selectedDate),
              style: titleStyle,
            ),
            Text(
              "Today",
              style: subHeadingStyle,
            )
          ],
        ),
        CustomButton(
          label: "+ Add Task",
          onTap: () async {
            await Get.to(() => const AddNewTask());
            taskController.getAllTasks();
          },
          height: 50,
          width: 130,
        ),
      ],
    ),
  );
}
