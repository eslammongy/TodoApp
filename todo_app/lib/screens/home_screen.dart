import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/screens/widgets/custom_appbar.dart';
import 'package:todo_app/services/notification_services.dart';
import 'package:todo_app/services/theme_services.dart';
import 'widgets/custom__button.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController taskController = Get.put(TaskController());

  DateTime selectedDate = DateTime.now();
  late LocalNotificationServices notificationHelper;
  @override
  void initState() {
    super.initState();
    notificationHelper = LocalNotificationServices();
    notificationHelper.requestIosPermission();
    notificationHelper.intilizationSettings();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context,
          title: "Home",
          widget: IconButton(
              onPressed: () {
                ThemeServices().switchThemeMode();
                notificationHelper.displayNotifications(
                    title: "Theme", content: "App Theme is changed.");

                notificationHelper.scheduleAppNotifications();
              },
              icon: Icon(
                Get.isDarkMode
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round_outlined,
                color: Get.isDarkMode ? orangeClr : darkGreyClr,
              ))),
      body: Column(
        children: [buildTaskBar(), displayCalenderView(), noTasksFound()],
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
              selectedDate = newDate;
            });
          },
        ));
  }

  displayAllTasks() {
    return Expanded(child: Obx(() {
      if (taskController.tasksList.isEmpty) {
        return noTasksFound();
      } else {
        return Container(
          height: 0,
        );
      }
    }));
  }

  Widget noTasksFound() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(microseconds: 3000),
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
        )
      ],
    );
  }
}
