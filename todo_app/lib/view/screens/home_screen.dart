import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/services/notification_services.dart';
import 'package:todo_app/services/theme_services.dart';
import 'package:todo_app/view/widgets/custom__button.dart';
import 'package:todo_app/view/widgets/custom_appbar.dart';
import 'package:todo_app/view/widgets/display_task_upper_view.dart';
import 'package:todo_app/view/widgets/task_bottom_sheet.dart';
import 'package:todo_app/view/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController = Get.put(TaskController());

  DateTime _selectedDate = DateTime.now();
  late NotifyHelper notificationHelper;
  @override
  void initState() {
    super.initState();
    notificationHelper = NotifyHelper();
    notificationHelper.requestIOSPermissions();
    notificationHelper.initializeNotification();
    taskController.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context,
          deleteVisiable: true,
          deleteTasks: () {
            displayDeleteDialog();
          },
          title: "Home",
          widget: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                ThemeServices().switchThemeMode();
              },
              icon: Icon(
                Get.isDarkMode
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round_outlined,
                color: Get.isDarkMode ? orangeClr : darkGreyClr,
                size: 25,
              ))),
      body: Column(
        children: [
          buildTaskBar(
              selectedDate: _selectedDate, taskController: taskController),
          displayCalenderView(),
          SizedBox(
            height: 10,
          ),
          displayAllTasks()
        ],
      ),
    );
  }

  displayBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        width: SizeConfig.screenWidth,
        height: (SizeConfig.orientation == Orientation.landscape)
            ? (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.6
                : SizeConfig.screenHeight * 0.8)
            : (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.45
                : SizeConfig.screenHeight * 0.40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Get.isDarkMode ? darkGreyClr : Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 8,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[700] : Colors.grey[200]),
            ),
            const SizedBox(
              height: 20,
            ),
            task.isCompleted == 1
                ? Container()
                : buildTaskBottomSheetButtons(
                    label: "Task Completed",
                    onTap: () {
                      taskController.markTaskAsCompleted(taskID: task.id!);
                      notificationHelper.cancelNotification(task);
                      Get.back();
                    },
                    color: primaryClr),
            Divider(
              color: Get.isDarkMode ? Colors.grey : darkGreyClr,
            ),
            buildTaskBottomSheetButtons(
                label: "Delete Task",
                onTap: () {
                  taskController.deleteSelectedTask(task: task);
                  notificationHelper.cancelNotification(task);
                  Get.back();
                },
                color: Colors.red[800]!),
            Divider(
              color: Get.isDarkMode ? Colors.grey : darkGreyClr,
            ),
            buildTaskBottomSheetButtons(
                label: "Cancel",
                onTap: () {
                  Get.back();
                },
                color: primaryClr),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }

  Widget displayCalenderView() {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 15),
        child: DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          width: 75,
          height: 100,
          dayTextStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.grey : Colors.black38,
                  fontSize: 15,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600)),
          dateTextStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.grey : Colors.black38,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600)),
          monthTextStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.grey : Colors.black38,
                  fontSize: 15,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w600)),
          selectionColor: Get.isDarkMode ? orangeClr : blueClr,
          selectedTextColor: Colors.white,
          onDateChange: (newDate) {
            setState(() {
              _selectedDate = newDate;
              taskController.getAllTasks();
            });
          },
        ));
  }

  displayAllTasks() {
    return Expanded(
      child: Obx(() {
        if (taskController.tasksList.isEmpty) {
          return noTasksFound();
        } else {
          return RefreshIndicator(
            onRefresh: () => taskController.getAllTasks(),
            child: ListView.builder(
              scrollDirection: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var task = taskController.tasksList[index];

                if (task.repeat == "Daily" ||
                    task.date == DateFormat.yMd().format(_selectedDate) ||
                    (task.repeat == 'Weekly' &&
                        _selectedDate
                                    .difference(
                                        DateFormat.yMd().parse(task.date!))
                                    .inDays %
                                7 ==
                            0) ||
                    (task.repeat == "Monthly" &&
                        DateFormat.yMd().parse(task.date!).day ==
                            _selectedDate.day)) {
                  var date = DateFormat.jm().parse(task.startTime!);
                  var taskTime = DateFormat('HH:mm').format(date);
                  notificationHelper.scheduledNotification(
                      int.parse(taskTime.toString().split(':')[0]),
                      int.parse(taskTime.toString().split(':')[1]),
                      task);
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 1200),
                    child: SlideAnimation(
                        horizontalOffset: 300,
                        child: FadeInAnimation(
                            child: GestureDetector(
                                onTap: () {
                                  displayBottomSheet(context, task);
                                },
                                child: TaskTile(task)))),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: taskController.tasksList.length,
            ),
          );
        }
      }),
    );
  }

  Widget noTasksFound() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(microseconds: 2000),
          child: RefreshIndicator(
            onRefresh: () => taskController.getAllTasks(),
            child: SingleChildScrollView(
                child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 50,
                      )
                    : const SizedBox(
                        height: 100,
                      ),
                Image.asset(
                  "assets/images/empty_box.png",
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Text(
                    "You don't have any task yet!",
                    style: subHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? const SizedBox(
                        height: 30,
                      )
                    : const SizedBox(
                        height: 100,
                      ),
              ],
            )),
          ),
        )
      ],
    );
  }

  void displayDeleteDialog() {
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
                      height: 60,
                    ),
                    CustomButton(
                        label: 'Yes',
                        onTap: () async {
                          taskController.deleteAllTasks();

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
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        });
  }
}
