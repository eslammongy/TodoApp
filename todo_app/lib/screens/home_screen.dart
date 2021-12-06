import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/screens/widgets/custom_appbar.dart';
import 'package:todo_app/services/theme_services.dart';
import 'widgets/custom__button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context,
          title: "Home",
          widget: IconButton(
              onPressed: () => ThemeServices().switchThemeMode(),
              icon: Icon(
                Get.isDarkMode
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round_outlined,
                color: Get.isDarkMode ? orangeClr : darkGreyClr,
              ))),
      body: Column(
        children: [buildTaskBar()],
      ),
    );
  }

  Widget buildTaskBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
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
}
