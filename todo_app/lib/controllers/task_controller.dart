import 'package:get/get.dart';
import 'package:todo_app/model/task.dart';

class TaskController extends GetxController {
  final tasksList = <Task>[
    Task(
        title: "Fitness",
        note: "Note me on time",
        startTime: "09:00",
        isCompleted: 0,
        endTime: "12:10",
        color: 0),
    Task(
        title: "Fitness",
        note: "Note me on time",
        startTime: "09:00",
        isCompleted: 1,
        endTime: "12:10",
        color: 3),
    Task(
        title: "Fitness",
        note: "Note me on time",
        startTime: "09:00",
        isCompleted: 1,
        endTime: "12:10",
        color: 1),
    Task(
        title: "Fitness",
        note: "Note me on time",
        startTime: "09:00",
        isCompleted: 0,
        endTime: "12:10",
        color: 2),
    Task(
        title: "Fitness",
        note: "Note me on time",
        startTime: "09:00",
        isCompleted: 0,
        endTime: "12:10",
        color: 4)
  ];
  getAllTasks() {}
}
