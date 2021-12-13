import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/widgets/custom__button.dart';
import 'package:todo_app/screens/widgets/flusher_bar.dart';
import 'package:todo_app/screens/widgets/input_from_field.dart';

import 'widgets/custom_appbar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedRebeat = 'None';
  List<String> rebeatList = ["None", "Daily", "Weekly", "Monthly"];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildCustomAppBar(
            context: context,
            title: "Add New Task",
            widget: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Get.isDarkMode ? orangeClr : darkGreyClr,
                ))),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeInputField(
                  title: "Title",
                  hint: "enter title here",
                  textEditingController: titleController,
                ),
                CustomeInputField(
                  title: "Note",
                  hint: "enter note here",
                  textEditingController: descController,
                ),
                CustomeInputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(selectedDate),
                  widget: IconButton(
                      onPressed: () {
                        getUserSelectedDate();
                      },
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomeInputField(
                      title: "Start Time",
                      hint: startTime,
                      widget: IconButton(
                          onPressed: () {
                            getUserSelectedTime(isStartTime: true);
                          },
                          icon: const Icon(
                            Icons.alarm_on_rounded,
                            color: Colors.grey,
                          )),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomeInputField(
                      title: "End Time",
                      hint: endTime,
                      widget: IconButton(
                          onPressed: () {
                            getUserSelectedTime(isStartTime: false);
                          },
                          icon: const Icon(
                            Icons.alarm_rounded,
                            color: Colors.grey,
                          )),
                    ))
                  ],
                ),
                CustomeInputField(
                  title: "Remind",
                  hint: '$selectedRemind minutes early',
                  widget: Row(
                    children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        items: remindList
                            .map<DropdownMenuItem<String>>(
                                (int item) => DropdownMenuItem<String>(
                                    value: item.toString(),
                                    child: Text(
                                      "$item",
                                      style: titleStyle,
                                    )))
                            .toList(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        elevation: 5,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedRemind = int.parse(value!);
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
                CustomeInputField(
                  title: "Rebeat",
                  hint: selectedRebeat,
                  widget: Row(
                    children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        items: rebeatList
                            .map<DropdownMenuItem<String>>(
                                (String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: titleStyle,
                                    )))
                            .toList(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        elevation: 5,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedRebeat = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    buildColorPallet(),
                    CustomButton(
                        label: "Save",
                        onTap: () {
                          validateData();
                        },
                        height: 50,
                        width: 100),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  getUserSelectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2030));

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    } else
      print("Null Date");
  }

  getUserSelectedTime({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(Duration(minutes: 15))));

    if (pickedTime != null) {
      String formatedTime = pickedTime.format(context);
      if (isStartTime) {
        setState(() => startTime = formatedTime);
      } else if (!isStartTime) {
        setState(() => endTime = formatedTime);
      }
    } else {
      print("No Time Picked");
    }
  }

  validateData() {
    if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
      insertNewTask();
      Get.back();
    } else {
      showFlushBar(context, "Some Required Date Is Empty", "Error");
    }
  }

  insertNewTask() async {
    int insertedValue = await taskController.addNewTask(
        task: Task(
            title: titleController.text,
            note: descController.text,
            date: DateFormat.yMd().format(selectedDate),
            startTime: startTime,
            endTime: endTime,
            remind: selectedRemind,
            repeat: selectedRebeat,
            color: selectedColor,
            isCompleted: 0));
  }

  buildColorPallet() {
    const List<Color> taskColors = [
      blueClr,
      orangeClr,
      pinkClr,
      purpleClr,
      greenClr
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: titleStyle,
          ),
          Wrap(
            direction: Axis.horizontal,
            children: List<Widget>.generate(
              5,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: selectedColor == index
                        ? Icon(
                            Icons.done,
                            size: 18,
                            color: Colors.white,
                          )
                        : null,
                    backgroundColor: taskColors[index],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
